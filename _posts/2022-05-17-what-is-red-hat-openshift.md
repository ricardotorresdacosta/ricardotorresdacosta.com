---
title: " What is Red Hat OpenShift?"
categories:
  - Kubernetes
  - OpenShift
  - Enterprise
toc: true
# classes: wide
header:
  teaser: assets/images/openshift/andreea-petruti-HCy06_Nerwc-unsplash.jpg
  overlay_image: assets/images/openshift/andreea-petruti-HCy06_Nerwc-unsplash.jpg
  overlay_filter: 0.5
excerpt: ""
---

OpenShift is a Red Hat product that builds a façade on top of Kubernetes. It takes an opinionated approach to Kubernetes with the goal of reducing the time teams spend trying to figure it out. OpenShift is an Enterprise offering with support guaranteed by Red Hat.

From the official website: *Red Hat OpenShift is an enterprise open-source container orchestration platform. It's a software product that includes components of the Kubernetes container management project, **but adds productivity and security features that are important to large-scale companies***

It works with public or private cloud, as well as bare-metal. The operating system is usually RHEL, but also works with CentOS. OpenShift is powered by Origin Kubernetes Distribution which includes:
  - Kubernetes
  - Container Runtime like Docker
  - Integrations with other services like service meshes

Overall, while vanilla Kubernetes allows for much more flexibility, it requires a lot of configuration and active management. OpenShift drastically simplifies the user experience both for developers and operations teams.

When deploying an application in Kubernetes, one has to manage the containerization of the source code, the image repository as well as all the CI/CD. In contrast, in OpenShift, all of this is abstracted away via its UI or CLI.

Another telling use case for the Kubernetes aficionados is the addition or removal of VMs to the cluster. Doing these actions is a tedious and time-consuming activity. OpenShift automates this process by leveraging Ansible playbooks.

RBAC, IAM and Auth are also streamlined by OpenShift which again leaves teams to focus on the least repetitive and high value tasks.

Finally, a big reason why OpenShift is very popular with enterprise users has to do with its security features. While Kubernetes requires extensive knowledge, configuration and management to make its clusters secure, OpenShift deploys hardened clusters out of the box. As an example, no containers in OpenShift can run as root. This addresses a serious security concern in Kubernetes. However, a downside for OpenShift in this example has to do with interoperability with Kubernetes workloads. Not all containers that run in a vanilla cluster will run in OpenShift. A container that expects root access will not be able to run in an OpenShift distribution and this can create problems for integrated solutions as well as migrations.

