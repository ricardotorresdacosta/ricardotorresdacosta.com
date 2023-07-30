---
title: "Do all software products follow a release cycle? What other approaches are there?"
categories:
  - CI/CD
  - DevOps
  - Enterprise
# classes: wide
toc: true
header:
  teaser: ../assets/images/jametlene-reskp-eF3eSMdYf80-unsplash_640x426.jpg
  overlay_image: ../assets/images/jametlene-reskp-eF3eSMdYf80-unsplash_1920x1280.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: "Booting a Linux system into a different target (also known as runlevel in older versions of Linux) can be achieved by using the `systemd` utility. This is a system and service manager for Linux operating systems."
review: 0
---

While many software products do follow a release cycle, it is not a hard and fast rule that all must do so. The nature of the software, the development methodology used, the market demand, and many other factors can impact whether a product adheres to a release cycle.

Typically, software release cycles include several stages: planning, development, testing, and deployment. These stages are repeated in cycles, with the length of the cycle varying depending on the product and the organization. 

# Common types of software releases

1. Major/Minor Releases: These are often planned and scheduled, with major releases including significant changes or new features, and minor releases providing smaller updates, bug fixes, or improvements.

1. Rolling Release: In a rolling release, software is continuously updated, and users can get new features and improvements as soon as they're developed and tested. This approach is popular with many open-source projects.

1. Long-Term Support (LTS) Release: These releases are intended to be stable and reliable for an extended period. They're commonly used for enterprise or critical systems where stability is more important than new features.

1. Patch Releases: Patch releases are small, unscheduled updates that fix specific problems. They're often used to correct security vulnerabilities or critical bugs.

1. Scheduled Release (e.g., Semi-Annual or Annual): Some companies prefer to set a fixed schedule, releasing updates at regular intervals. This approach can make it easier for users and administrators to plan for updates.

# Alternatives to release cycles

Some software products may not follow a strict release cycle at all, especially if they are developed using Agile, Continuous Integration/Continuous Deployment (CI/CD), or DevOps methodologies. In these methodologies, updates may be pushed out as soon as they are ready, leading to a continuous stream of smaller updates rather than large, infrequent releases. This is sometimes known as a "continuous delivery" or "continuous deployment" model.

Furthermore, some software, especially SaaS (Software as a Service), may be updated on the server-side without the user needing to install or update anything. This allows for continuous updates and improvements without the need for a formal release cycle.

Finally, it's worth noting that beta or alpha releases, early access programs, and other types of pre-release software often don't follow a strict release cycle, as the primary goal in these stages is to gather feedback and fix bugs.

# What's the difference between rolling releases and continuous deployment?

Rolling releases and continuous deployment are similar in that they both involve releasing software updates frequently, but there are important differences in how they are implemented and used.

Rolling Release: This is a model often used in software distribution, particularly in the context of operating systems or large-scale software projects. In a rolling release model, updates for every component of the software are released frequently, allowing users to stay on the cutting edge of software development. The advantage of this model is that it allows users to receive the latest features and improvements without having to wait for a major release. However, because these updates are often not as thoroughly tested as those in a major release, they may introduce new bugs or compatibility issues.

Continuous Deployment: This is a software development practice where code changes are automatically built, tested, and prepared for release to production. It's a step beyond continuous integration, and it requires a high level of test automation to ensure that each change can be safely and quickly deployed to production. Continuous deployment is typically used in the development of web applications or other software where changes can be released to users immediately and seamlessly.

The key difference between the two is that rolling releases refer more to the distribution model, where updates are released to all users as they become available, while continuous deployment is a development practice focused on getting changes into production as quickly and safely as possible.

In other words, continuous deployment is a methodology followed by the development team to ensure rapid, consistent, and reliable delivery of software. A rolling release, on the other hand, is a strategy for distributing these updates to the end-users.

It's possible for a software product to use both continuous deployment (for developing and preparing updates) and a rolling release model (for distributing those updates to users). This can provide users with the benefits of both practices: rapid access to new features and improvements, and high reliability of updates.

One common example is in enterprise software or Software-as-a-Service (SaaS) products. The development team may practice continuous deployment, constantly integrating and deploying changes to the production environment. However, these changes may not immediately be visible to all users due to practices like feature flagging or canary releases.

Here's how those work:

Feature Flags: This is a technique that allows developers to enable or disable features in a live environment. Even though new code might be deployed to production, the relevant feature might be turned 'off' by default and only enabled for certain users (like beta testers) or at certain times.

Canary Releases: Named after the 'canary in a coal mine' concept, this involves releasing new features to a small, controlled group of users before rolling it out to everyone. The goal here is to limit the potential damage from bugs and to gather feedback and data on the new feature's use.

In both of these cases, continuous deployment is happening – every change is automatically built, tested, and deployed. However, a 'rolling release' for all users isn't happening because the new features are controlled and only available to a subset of users or at certain times.

Finally, another scenario is when companies practice continuous deployment but bundle updates into scheduled releases. In this case, they may deploy continuously to their production environment, but end-users only receive these updates at predetermined times (e.g., monthly, quarterly). This is common in industries where clients or end-users need to prepare or approve updates, like in healthcare or finance.

# What is production?

In these contexts, "production environment" refers to the stable version of the software that's live and has passed all stages of development, testing, and staging. Even if a new feature deployed to this environment isn't immediately available to all users, the environment itself is still considered production because it's the live, operational state of the software.