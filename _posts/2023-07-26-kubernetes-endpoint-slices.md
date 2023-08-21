---
title: "What are Kubernetes Endpoint Slices? Why do they exist? How are they implemented?"
categories:
  - Kubernetes
  - Networking
# classes: wide
toc: true
header:
  teaser: ../assets/images/nikolai-chernichenko-hFBsF-CX5eQ-unsplash_640x426.jpg
  overlay_image: ../assets/images/nikolai-chernichenko-hFBsF-CX5eQ-unsplash_1920x1280.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "Endpoint Slices are a Kubernetes API resource introduced to provide a scalable and extensible way to represent network endpoints in a Kubernetes cluster. They were introduced in Kubernetes 1.16, which was released in September 2019. They are primarily intended to improve the scalability and performance of Kubernetes Service resources. "
---

# What are Endpoint Slices?

Endpoint Slices are a Kubernetes API resource introduced to provide a scalable and extensible way to represent network endpoints in a Kubernetes cluster. They were introduced in Kubernetes 1.16, which was released in September 2019. They are primarily intended to improve the scalability and performance of Kubernetes Service resources. 

Endpoint Slices store a subset of the endpoints for a given Service in Kubernetes. An "endpoint" in this context refers to a combination of an IP address and a port number that represents a network destination for a Service.

When compared to the older `Endpoints` API, Endpoint Slices are:

1. **More Scalable**: They allow for distributing endpoint information more efficiently, especially for larger services.
1. **Extensible**: They provide a way to include more metadata about each endpoint, including topology information.

# Why do they exist?

The primary motivation for introducing Endpoint Slices was scalability.

Previously, the `Endpoints` resource stored all the endpoints of a Service in a single resource. This became problematic for Services with a large number of pods, as the entire Endpoints object would need to be transferred and processed any time a single pod was added or removed. For Services with thousands of Pods, this wasn't efficient. When you create a Service in Kubernetes, the system **automatically** creates corresponding Endpoints to store the IP addresses of Pods that match the Service's selector.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

For this Service, Kubernetes would create an `Endpoints` object named my-service that lists the IP addresses of all Pods in the cluster that have the label `app=my-app`.

An example of what the `Endpoints` object might look like:
```yaml
apiVersion: v1
kind: Endpoints
metadata:
  name: my-service
subsets:
  - addresses:
      - ip: 10.1.2.3
    ports:
      - port: 8080
        protocol: TCP
  - addresses:
      - ip: 10.1.2.4
    ports:
      - port: 8080
        protocol: TCP
```
In this example, there are two Pods (with IPs `10.1.2.3` and `10.1.2.4`) that match the Service's selector, so they are listed in the Endpoints resource.

Endpoint Slices solve this problem by breaking up the list of endpoints into smaller, more manageable chunks. Each chunk also offers additional metadata about each endpoint.

# How are they implemented?

Endpoint Slices are automatically managed by the EndpointSlice controller within the Kubernetes control plane. This controller watches for changes to Services and Pods and creates, updates, or deletes Endpoint Slices as necessary.

**Key Features**:

- **Endpoint Distribution**: Each Endpoint Slice has a limit to the number of endpoints it can store (by default, 100). When this limit is reached, additional Endpoint Slices are created for the Service.

- **Labels**: Each Endpoint Slice is labeled with the Service's name. This makes it easy to query all Endpoint Slices for a given Service.

- **Address** Types: Endpoint Slices support multiple address types (IPv4, IPv6, and FQDN).

# General Use Case

Imagine a Kubernetes Service named `big-service` that matches 250 pods. Due to the scalability improvements offered by Endpoint Slices, Kubernetes might divide these endpoints across three Endpoint Slices.

Firstly, your `Service` definition:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: big-service
spec:
  selector:
    app: big-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

Here's how Kubernetes might represent this using Endpoint Slices:

1st Endpoint Slice:
```yaml
apiVersion: discovery.k8s.io/v1beta1
kind: EndpointSlice
metadata:
  name: big-service-xyz1
  labels:
    kubernetes.io/service-name: big-service
addressType: IPv4
ports:
  - name: http
    protocol: TCP
    port: 80
endpoints:
  - addresses:
      - "10.1.2.1"
    conditions:
      ready: true
  ...
  # Assume 99 more endpoints here, making it a total of 100 endpoints for this slice.
```

2nd Endpoint Slice:
```yaml
apiVersion: discovery.k8s.io/v1beta1
kind: EndpointSlice
metadata:
  name: big-service-xyz2
  labels:
    kubernetes.io/service-name: big-service
addressType: IPv4
ports:
  - name: http
    protocol: TCP
    port: 80
endpoints:
  - addresses:
      - "10.1.3.1"
    conditions:
      ready: true
  ...
  # Again, assume 99 more endpoints, making it 100 for this slice.
```

3rd Endpoint Slice (with 50 endpoints):
```yaml
apiVersion: discovery.k8s.io/v1beta1
kind: EndpointSlice
metadata:
  name: big-service-xyz3
  labels:
    kubernetes.io/service-name: big-service
addressType: IPv4
ports:
  - name: http
    protocol: TCP
    port: 80
endpoints:
  - addresses:
      - "10.1.4.1"
    conditions:
      ready: true
  ...
  # Assume 49 more endpoints here, making it a total of 50 endpoints for this slice.
```

When considering all three Endpoint Slices, we have a representation of the 250 endpoints for the `big-service`. Kubernetes tools and components will aggregate information across all these slices when necessary.

It's important to note that the actual distribution across Endpoint Slices can vary based on the state of the cluster, how many Pods are being added/removed, etc. The examples above simply demonstrate the concept.

# Use Case: Custom Endpoints for External Services

## Background Story
Imagine you have a Kubernetes cluster running your main application stack. However, you also have a legacy database system running outside of the cluster on a VM or a bare-metal server. Your Kubernetes-based applications need to interact with this database.

Since the database isn't running in a Pod within the Kubernetes cluster, it won't automatically get an Endpoint via standard service discovery. But, to make service discovery easier for applications in the cluster, you decide to manually create an Endpoint Slice to represent this external database.

By creating a custom Endpoint Slice, you can leverage Kubernetes service discovery mechanisms to allow applications in your cluster to find and communicate with the external database as if it were another service within the cluster.

## Code Example

First, let's create a Service without a selector. The absence of a selector indicates that the Service won't automatically manage its endpoints:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-db-service
spec:
  ports:
  - protocol: TCP
    port: 5432
    targetPort: 5432
```

This creates a Service in Kubernetes, but since there's no selector, no Pods will be associated with it automatically.

Next, let's manually create an Endpoint Slice to represent the external database:

```yaml
apiVersion: discovery.k8s.io/v1beta1
kind: EndpointSlice
metadata:
  name: external-db-endpointslice
  labels:
    kubernetes.io/service-name: external-db-service
addressType: IPv4
ports:
  - name: db
    protocol: TCP
    port: 5432
endpoints:
  - addresses:
      - "192.168.1.100"  # IP address of the external database server.
    conditions:
      ready: true
```

In this configuration:

- The Endpoint Slice is associated with the Service via the `kubernetes.io/service-name` label.
- We specify the external IP address ("192.168.1.100") of the database server.
- The port "5432" is commonly used for PostgreSQL, but you'd adjust it based on your database type and configuration.

With this setup, applications within the Kubernetes cluster can connect to `external-db-service` on port 5432, and they will be routed to the external database server at "192.168.1.100". This approach abstracts away the fact that the database is external, simplifying service discovery for in-cluster applications.

This method provides a consistent way for applications to interact with services, whether they are inside or outside the cluster. However, remember that while this simplifies the service discovery aspect, it doesn't handle authentication, encryption, or other network policies that might be required for secure communication with external systems.