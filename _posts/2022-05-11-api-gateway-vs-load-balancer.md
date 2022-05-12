---
title: "What is the difference between API Gateway and Load Balancer?"
categories:
  - Networking
header:
  teaser: assets/images/api-loadbalancer/ddp-F_aEVgymKEo-unsplash.jpg
  overlay_image: assets/images/api-loadbalancer/ddp-F_aEVgymKEo-unsplash.jpg
  overlay_filter: 0.5
excerpt: ""
---

[In the previous post](https://torresdacosta.com/api-gateway-vs-service-mesh), I clarified the difference between an API Gateway and a Service Mesh. However, another common question is the difference between an API Gateway and a Load Balancer. After all, both sit in front of the back end and direct incoming traffic. While that is true, they work in different ways and at different abstraction levels. 

A Load Balancer directs traffic to different instances of the same type of asset. The simplest example is a cluster of servers. By means of an algorithm (eg. round-robin), as more connections are made, the load balancer *balances* the traffic across the different servers. This leads to gains in responsiveness and availability of services.  

API Gateways are much more fine-grained. They are capable of directing traffic to specific API endpoints. *While a Load Balancer directs incoming traffic to different instances of the same asset, an API Gateway directs traffic to different APIs*. 

These two tools can be used together. However, it's also common for API Gateways to have load balancing embedded in their functioning.