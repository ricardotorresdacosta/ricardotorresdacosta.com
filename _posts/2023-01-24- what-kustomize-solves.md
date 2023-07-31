---
title: "What problems does Kustomize solve?"
categories:
  - Kustomize
  - Kubernetes
# classes: wide
toc: true
header:
  teaser: ../assets/images/ambitious-studio-rick-barrett-O9BznaWPO2M-unsplash_640x426.jpg
  overlay_image: ../assets/images/ambitious-studio-rick-barrett-O9BznaWPO2M-unsplash_1920x1280.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "Kustomize is an open-source tool developed to manage complex Kubernetes configurations in a declarative way. It was designed to meet the need for a template-free way to customize application configurations, and was included in kubectl in Kubernetes v1.14."
---

# What is Kustomize?

Kustomize is an open-source tool developed to manage complex Kubernetes configurations in a declarative way. It was designed to meet the need for a template-free way to customize application configurations, and was included in kubectl in Kubernetes v1.14.

In Kubernetes, there's often a need to reuse and customize application configurations across multiple environments like development, staging, and production. A simple solution could be to use templates or parameter files, but it becomes cumbersome to manage these files for complex applications with many parameters. Kustomize provides an alternative solution by allowing you to define a base configuration and apply overlays, or modifications, specific to each environment.

Kustomize introduces a template-free way to customize application configuration that simplifies the use of off-the-shelf applications. With Kustomize, you can manage an application's configuration independently of the application itself. This makes it easy to modify the configuration without touching the application's original configuration files.

Kustomize works with the native Kubernetes YAML or JSON format and doesn't require any templates. This eliminates the need for placeholder replacements, which can be difficult to track and manage in large configurations. Instead, Kustomize uses a patching approach where it applies changes on top of the original configuration, which preserves the structure and syntax of the original files.

# Use cases

**Multi-environment configuration**: You can use Kustomize to manage different configurations for different environments. You can have a base configuration and then create overlays for each environment that modify specific aspects of the base configuration.

**Reusable components**: Kustomize allows you to create components that can be reused across different applications. This is useful when you have common pieces of configuration that are shared by different applications.

**Secrets and ConfigMaps management**: Kustomize can generate Kubernetes Secret and ConfigMap objects from files, literals or other Secret and ConfigMaps.

**Handling resources**: Kustomize allows to add, remove or update Kubernetes resources from the base configuration, giving the possibility to easily adjust the base configuration according to specific needs.

**Applying common labels and annotations**: You can use Kustomize to add common labels and annotations to all the resources in your configuration. This can be useful for tracking resources, adding versioning information, or specifying environmental information.

**Continuous Deployment/Continuous Integration (CI/CD)**: Kustomize is a great tool for managing Kubernetes configuration in a CI/CD pipeline. It allows the CI/CD tool to deploy the same application with different configurations to different environments.

By organizing configuration changes in a hierarchical way and managing variations across deployments, Kustomize helps to maintain a high degree of control over resources while reducing complexity.

# Some examples

## Multi-environment configuration  
   Let's suppose you have a Kubernetes deployment of a simple web application. You have a base configuration file `deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 1
  template:
    spec:
      containers:
      - name: my-app
        image: my-app:1.0.0
        env:
        - name: ENV
          value: development
```
To manage different environments, you can create a `kustomization.yaml` file in the base directory:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- deployment.yaml
```
Then, for each environment, you can create an overlay directory (e.g., `overlays/staging` and `overlays/production`) with their own `kustomization.yaml` files that specify the changes. For instance, the `kustomization.yaml` file in `overlays/staging` might look like this:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- ../../base
patchesStrategicMerge:
- patch.yaml
```
The `patch.yaml` file could look like this:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 2
  template:
    spec:
      containers:
      - name: my-app
        env:
        - name: ENV
          value: staging
```

To apply the staging configuration, you can use this command:

```bash
kubectl apply -k overlays/staging
```

## Generating ConfigMaps and Secrets
You can also use Kustomize to generate ConfigMaps and Secrets. For example, you could create a `kustomization.yaml` file that looks like this:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
configMapGenerator:
- name: my-configmap
  files:
  - config.properties
secretGenerator:
- name: my-secret
  literals:
  - username=admin
  - password=secret
```
Then you can create the resources with this command:

```bash
kubectl apply -k .
```

## Adding labels and annotations
You can add common labels and annotations to all resources in your configuration. Here is an example `kustomization.yaml` file:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
commonLabels:
  app: my-app
  env: production
commonAnnotations:
  note: This is a production cluster
resources:
- deployment.yaml
```
Then apply the configuration with this command:

```bash
kubectl apply -k .
```
These are just some of the many ways that Kustomize can be used to manage Kubernetes configurations.