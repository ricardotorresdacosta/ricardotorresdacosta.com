---
title: "Why does GitOps not use pipelines?"
categories:
  - GitOps
  - CI/CD
  - Kubernetes
# toc: true
# classes: wide
header:
  teaser: assets/images/gitops-pipelines.png
  overlay_image: assets/images/gitops-pipelines.png
  overlay_filter: 0.5
excerpt: ""
review: 1
---

GitOps is a way to manage and apply changes to infrastructure and applications based on the Git version control system. The primary reason that GitOps doesn't traditionally use pipelines is because it uses a different paradigm for implementing changes.

In the traditional CI/CD (Continuous Integration/Continuous Delivery) pipeline model, changes are pushed through a pipeline where they are built, tested, and deployed.

GitOps, on the other hand, works on a pull-based system. Git is seen as the single source of truth. The desired state of the system is declared in Git. An operator in the cluster (like Flux, ArgoCD, or Jenkins X) continuously compares the actual state of the system with the desired state declared in Git. If there's any divergence, the operator pulls the changes from Git and applies them to the system.

The fundamental shift in GitOps from the traditional pipeline model is this pull-based system. It ensures that all changes to the system are declarative and version controlled. It eliminates the need for traditional pipelines by directly reconciling the system's state with the state declared in Git. However, it doesn't completely eliminate the concept of pipelines. Continuous Integration (CI) pipelines are still used to build and test the software before the new container images are pushed to a container registry. **GitOps mainly takes over the Continuous Delivery (CD)** part where the new container images are deployed to the Kubernetes clusters.

It is also important to note that there can still be some pipeline-like processes, but they aren't typically described as pipelines in the GitOps world. They are more about synchronization and reconciliation processes. This might include validating changes, packaging software, or releasing it.

In summary, **GitOps doesn't completely eliminate pipelines but changes how and where they are used**. This is mainly a consequence of its pull-based philosophy, where changes are pulled from a Git repository, rather than being pushed through a pipeline.

See more about GitOps from the inventors of the term [Weaveworks](https://www.weave.works/blog/what-is-gitops-really).