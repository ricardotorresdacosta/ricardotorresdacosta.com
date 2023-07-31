---
title: "What are Event-Driven Microservices?"
categories:
  - Events
  - Microservices
  - Architecture
# classes: wide
toc: true
header:
  teaser: ../assets/images/jason-leung-Xaanw0s0pMk-unsplash_640x426.jpg
  overlay_image: ../assets/images/jason-leung-Xaanw0s0pMk-unsplash_1920x1600.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "Event-driven microservices are a form of software architecture where the microservices within a system communicate with each other through events. This design pattern leverages events as a core part of the system's communication and operations."
---

# What are Event-Driven Microservices?
Event-driven microservices are a form of software architecture where the microservices within a system communicate with each other through events. This design pattern leverages events as a core part of the system's communication and operations.

Each microservice operates independently and can generate or listen to events. An event is a change in state, or an update, that occurs within the system. This could be something like a user clicking a button on a website, an internal process updating data, or a specific time or date being reached. When an event occurs, any microservices that are listening for that event will receive it and respond accordingly.

Crucially, when an event is emitted, the emitter doesn't need to wait for the processing to complete, which makes the process asynchronous. The event is picked up and handled by whatever service is interested in that event, whenever it's ready to do so. This means services can operate independently of one another, which can result in improved system performance, better scalability, and enhanced resilience. 

# The problems they solve

**Scalability**: Event-driven architecture allows services to be scaled independently based on demand. For example, during peak usage times, the services handling the most load can be scaled up, while others are not affected.  

**Decoupling**: Services are not directly dependent on each other. They do not need to know about each other's implementation, which makes the system more flexible and easier to maintain and develop. 

**Resiliency**: Failure in one service does not immediately affect the others. Services can continue to function in isolation even if another service goes down.

**Real-time responsiveness**: Events can be processed as soon as they occur, leading to real-time, or near real-time, responsiveness. This is beneficial in systems where timing is critical.

**Complexity management**: Each microservice handles a specific business capability, breaking down a complex problem into manageable parts.

# Use cases

**E-commerce platforms**: When a customer places an order, an 'Order Placed' event is created. This event could trigger the inventory service to reduce stock, the billing service to charge the customer, and the shipping service to prepare the item for dispatch. If any of these services fail, they can be restarted and process the event again without affecting the others.

**Social networking platforms**: If a user posts a new message, an 'New Post' event is created. This event can notify the notification service to send alerts to followers, the news feed service to include the post in relevant feeds, and an analytics service to update post statistics.

**Banking and financial systems**: In a stock trading application, if a user decides to sell a particular stock, a 'Sell Order' event is generated. This could trigger a service to match the sell order with a buy order, a service to update the user's portfolio, and a service to send a confirmation to the user.

**Internet of Things (IoT) systems**: When an IoT device (like a smart thermostat) records a temperature above a certain threshold, it could generate a 'High Temperature' event. This event could then trigger a cooling system to activate, a logging service to record the event, and a user notification service to send an alert.

**Real-time analytics platforms**: In a system monitoring website traffic, each visit could generate a 'Page Viewed' event. This event could be consumed by services responsible for updating real-time dashboards, services that alert on high traffic volumes, and services that analyze user behavior patterns.

**Media platforms**: On a video streaming platform, when a user starts watching a video, a 'Video Stream Started' event could be generated. This could trigger a recommendation service to update its algorithm, an ad service to queue relevant ads, and a billing service to charge for premium content.

# Alternatives to Event-Drive Architecture
Microservices can also communicate with each other using methods other than events.

## Request/Response 
In this model, one service makes a request to another and waits for a response. This is a synchronous form of communication, where the requesting service is blocked until it receives a response.

**Example**: A web application where a user requests a webpage. The web server may need to request data from a database before it can respond to the user. The web server is blocked until it receives a response from the database.

**Comparison with events**: This method is simple and intuitive, as it follows a similar pattern to function calls in programming. However, it does not scale as well as event-driven systems, as the requesting service is blocked while waiting for responses.

## Database Sharing
Microservices can communicate with each other by sharing a common database. One service can write data to the database, and another can read it.

**Example**: An e-commerce application where one service writes order data to a database, and another reads this data to generate invoices.

**Comparison with events**: This method can be straightforward and efficient for simple applications. However, it can lead to tight coupling between services, as they must agree on a database schema. It can also lead to issues with data consistency and isolation.

# Different implementations of events

Events can be implemented in various ways, depending on the specific needs of your system. Here are a few common techniques:

**Polling**: This is a basic way of implementing events, where each service periodically checks a shared resource (like a database or message queue) for new events. This can be easy to implement, but it can also lead to inefficiency, as services may spend a lot of time checking for events that don't exist.

**Message Queues**: In this model, events are messages that are written to a queue. Services can write events to the queue, and other services can read them. Some popular message queuing systems include RabbitMQ, Apache Kafka, and Amazon SQS. This model provides a good level of decoupling between services, as they do not need to know about each other's implementation details.

**Publish/Subscribe (Pub/Sub)**: This model is similar to the message queue model, but with an additional level of indirection. Services publish events to a message broker, and other services subscribe to the types of events they are interested in. This allows for efficient distribution of events to multiple services. Examples of Pub/Sub systems include Google's PubSub service, Apache Kafka, and MQTT (a lightweight protocol often used in IoT devices).

**Webhooks**: This is a type of callback mechanism where one service will send an HTTP request to another service when an event occurs. Webhooks are a popular choice for web-based APIs and services. For instance, GitHub provides webhook functionality that can alert your service whenever a new commit is made to a repository.

**Server-Sent Events (SSE)**: This is a standard that allows a server to push events to a client over HTTP. It's typically used for pushing real-time updates from a server to a web application.

**WebSockets**: This is a communication protocol that provides full-duplex communication between a client and a server over a single, long-lived connection. It can be used to push events from a server to a client, or from a client to a server.

**Event Sourcing**: This is a design pattern where changes to application state are stored as a sequence of events. These events can be replayed to reconstruct the current state. It can be used to implement events in a system, and also provides benefits like auditing and debugging.

**gRPC or GraphQL Subscriptions**: Both of these technologies support real-time updates where a service can push updates to clients that have subscribed to certain types of events.