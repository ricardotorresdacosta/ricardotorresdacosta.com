---
title: "What is AWS Control Tower?"
categories:
  - AWS
  - DevOps
#toc: true
# classes: wide
header:
  teaser: assets/images/aws-control-tower/tim-mossholder-p_Hw00UrHPE-unsplash .jpg
  overlay_image: assets/images/aws-control-tower/tim-mossholder-p_Hw00UrHPE-unsplash .jpg
  overlay_filter: 0.5
excerpt: ""
---

The official website introduces [AWS Control Tower](https://aws.amazon.com/controltower) in the following way: *AWS Control Tower provides the easiest way to set up and govern a secure, **multi-account** AWS environment, called a landing zone.* This is an AWS native service providing a pre-defined set of blueprints and guardrails. This is different from [AWS Landing Zone](https://aws.amazon.com/solutions/implementations/aws-landing-zone/) in that the latter is more customizable and usually implemented by AWS partner companies. AWS Control Tower is meant to be easy and self-service.

This service **automates the provisioning of accounts** via an account factory, based on best-practice blueprints, all the while applying guardrails. It also includes a logging and monitoring service that provides visibility over the accounts, the organizational units and the guardrails. In other words, AWS Control Tower is ideal for people or companies that need to create different accounts and are looking to avoid an exponential growth in complexity as they scale up.

The features this service offers are many:
  - identity management using AWS SSO Directory,
  - federated access using AWS Single Sign-On (AWS SSO), 
  - a central log archive using AWS CloudTrail and AWS Config,
  - enabling security audits across accounts using AWS SSO, 
  - implementations of network configurations using Amazon Virtual Private Cloud (Amazon VPC), and 
  - definition of workflows for provisioning accounts using AWS Service Catalog and associated Control Tower solutions.

AWS Control Tower automatically implements guardrails:
  -  AWS CloudFormation to establish a baseline, 
  -  AWS Organizations service control policies (SCPs) to prevent configuration changes, and 
  -  AWS Config rules to continuously detect non-conformance.