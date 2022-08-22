---
title: "Are all applications with a database stateful?"
categories:
  - Kubernetes
  - Software Architecture
#toc: true
# classes: wide
header:
 teaser: ../assets/images/jan-antonin-kolar-lRoX0shwjUQ-unsplash_640x444.jpg
 overlay_image: ../assets/images/jan-antonin-kolar-lRoX0shwjUQ-unsplash_2400x1666.jpg
 overlay_filter: 0.5
excerpt: ""
---


For some time this got me confused. There is much to be said about the advantages of stateless applications. Availability and resilience are much easier to achieve with this type of application. Indeed, Kubernetes, the work-horse for many of us in the cloud native industry, was designed with stateless applications in mind. It was only in Kubernetes `1.5` that the `statefulset` resource was introduced and in `1.9` it became `stable`.

However, most applications I know of include some type of database. Even a simple static HTML page with authentication has to store the login information. 

Does this mean that stateless applications are a rare and almost theoretical use case? The answer to this is nuanced. One may think of a typical layered application with front-end, back-end and database as a single application, a traditional monolith. However, an alternative way of conceptualizing it is by considering it as three applications that work together. In the former case, indeed the application is stateful. Each instance of the full application stores state. As soon as replicas exist, data replication concerns have to be addressed and scale becomes challenging. In contrast, in the latter case, which is common in the world of microservices and containers, both front-end and back-end are decoupled from the database. This means that front-end and back-end are (or can be) stateless applications while the only component of this stack that holds state is the database. 

With this second approach, a large chunk of our code-base can benefit from all the positive attributes of statelessness while focussing our data storage and replication attention on the database service. The scalability of databases is a known challenge with a number of approaches to tackle. This separation of concerns between stateless and stateful microservices in the same application greatly facilitates its development and maintenance.
