---
title: "What is the difference between API Gateway and Service Mesh?"
categories:
  - Networking
header:
  teaser: assets/images/service-mesh/tengyart-jERbb8EK6Ks-unsplash.jpg
  overlay_image: assets/images/service-mesh/tengyart-jERbb8EK6Ks-unsplash.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: ""
# toc: true
---
Both terms are common in the development of Cloud Native applications. They both deal with inter-application communication but they are not the same.

API Gateways sit at the edge of the network and expose the system to the outside world. Clients go through them to reach the services implemented in the back-end of the application. It tracks the health of the overall application.

In contrast, a Service Mesh is not exposed to the outside of the network. It intermediates the communication between different microservices. In particular, it solves the problem of dynamic internal network addresses of the microservices, by means of an automatic self-discovery process that constantly tracks them. Service Meshes identify problems with specific microservices.

Both tools' functionalities could be implemented directly by the application developers. However, that would create issues of scalability, maintainability and security. As such, most modern Cloud Native settings showcase both sets of tools.