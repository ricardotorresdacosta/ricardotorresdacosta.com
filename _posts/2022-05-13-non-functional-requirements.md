---
title: "What are Non-Functional Requirements? A brief explanation"
header:
  teaser: assets/images/non-functional-reqs/will-langenberg-feut78NRNJk-unsplash.jpg
  overlay_image: assets/images/non-functional-reqs/will-langenberg-feut78NRNJk-unsplash.jpg
  overlay_filter: 0.5
excerpt: ""
categories:
  - Software Architecture
  - Enterprise Architecture
---


I like to think of Non-Functional Requirements (NFR) as system-wide requirements. Since they are not attached to a specific behaviour or **function** (that's where *functional* comes from) you can also think of them as cross-functional requirements. Here are a couple of examples for the win.

Example 1: An application must be able to log in a user into her own account. Being able to log in is a functional requirement. However, doing so in a secure, fast and simple way has to do with Non-Functional Requirements. Each of these is respectively associated with Security, Performance and Usability.  

Example 2: A system may be required to present the user with a display of the number of records in a database. This is a functional requirement. How current this number needs to be, is the NFR Timeliness.

There are many potential Non-Functional Requirements: accessibility, accountability, accuracy, adaptability, administrability, affordability, agility, auditability, autonomy, availability, compatibility, composability, configurability, correctness, credibility, customizability, debugability, degradability, determinability, demonstrability, dependability, deployability, discoverability, distributability, durability, effectiveness, efficiency, evolvability, extensibility, failure, transparency, fault-tolerance, fidelity, flexibility, inspectability, installability, integrity, interchangeability, interoperability, learnability, maintainability, manageability, mobility, modifiability, modularity, operability, orthogonality, portability, precision, predictability, process, capabilities, producibility, provability, recoverability, relevance, reliability, repeatability, reproducibility, resilience, responsiveness, reusability, robustness, safety, scalability, seamlessness, self-sustainability, serviceability, securability, simplicity, stability, standards, compliance, survivability, sustainability, tailorability, testability, timeliness, traceability, transparency, ubiquity, understandability, upgradability, vulnerability, usability…

A bit overwhelming eh? The sheer number of potential requirements contributes to different companies having different definitions of individual Non-Functional Requirements. Indeed, different authors present different definitions. Here, I list a few of the most commonly used ones and provide some pointers to address them.

### Performance Efficiency
The most common metric for this NFR is the time response of the system. For example, how long does it take for the page to render, a transaction to complete, etc.
Some actions to improve this NFR can be the setting up of caching procedures or using edge computing.

### Scalability
Scalability is related to performance. It assesses the highest workloads under which the system will still meet the performance requirements. Conversely, what is the decrease in time response under heavy loads?
How do you ensure your application will perform under heavy loads? 
For example, can you be confident that your front-end service supports 1,000 concurrent users with under 2 seconds response time in a Chrome browser?

### Compatibility 
In this NFR, one can ask whether our software functions well when other applications or features share the same environment. For instance, in a microservices architecture, will adding a new service impact the shared global event bus? In a monolith application, will adding a new database provider break the front-end view?

### Portability
Does our application work in different environments? On which operating systems and their versions, will the application be able to run? With which browsers and their versions will the application be compatible? Are there any specific devices and other hardware requirements? Are there any specific networking requirements?

### Usability
How hard is it to use the product? How fast is it for users to complete the main actions once they see the interface? How quickly can users reach their goals? Can users return to the interface after some time and start efficiently working with it right away? How often do users make mistakes? Is the design pleasant to use?

The most common way to assess usability is with a focus group to provide feedback on the application. Indeed, only testing with real users can reveal the usability problems.

### Reliability
What is the probability of failure of the application during a given period of time? The lowest this indicator, the higher the reliability of the application. If the system has 95 per cent reliability for a month, this means that during this month, under normal usage conditions, there’s an 95 per cent chance that the system won’t experience critical failure. To calculate this probability is not trivial. Two simpler metrics are the number of failures per period of time and its reverse which is the mean time between failures. 

The best way to measure this before production is to record the number of failures during testing.

### Availability
One can define it as the percentage of time the system is accessible for operation during some time period. For instance, the system may be available 98 per cent of the time during a month. Unlike reliability, which counts the inverse of the number of failures, availability counts the time that the system is up. As such, apart from the frequency of failures (reliability), the critical aspect here is how fast the system can be available again after a failure.

When one hears about how many nines are in the availability of cloud services, it is referring to this NFR. A one nine availability means that a system is up 90% of the time in a given period. A four nines availability means that a system will be up 99.99% of the time.

### Security
The main goal of Security is to ensure that all data inside the system or its part will be protected against malware attacks or unauthorized access. In particular one has to think about what industry standards to follow? Also, what common specific threats are addressed.
Some examples are:
  - The payment processing gateway must be PCI DSS compliant.
  - Only the users with the role “site admin” can view the applicant’s verified phone number.
  - All passwords have a 30-day expiration frequency

### Maintainability
This is also a significant one. It assesses how easy it is for a system to be supported, changed, enhanced, and restructured over time. If the system is important, a team must be responsible to maintain it. Considerations here also depend on the lifespan of the application. Longer lived applications require more attention to this requirement.

However, assuming the system is indeed important and long-lived, maintainability is crucial and best practices should be used to avoid technical debt, namely:
  - high cohesion/low coupling
  - [SOLID principles](https://en.wikipedia.org/wiki/SOLID)
  - standard API formats
  - clear document interfaces
