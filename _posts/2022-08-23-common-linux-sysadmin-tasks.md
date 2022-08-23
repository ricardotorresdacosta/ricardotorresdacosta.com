---
title: "What are the basic tasks a Linux Sysadmin should do on her homelab?"
categories:
  - Linux
  - Homelab
#toc: true
# classes: wide
header:
 teaser: ../assets/images/deva-darshan-Jt9syHEhrPE-unsplash_640x364.jpg 
 overlay_image: ../assets/images/deva-darshan-Jt9syHEhrPE-unsplash_2400x1367.jpg
 overlay_filter: 0.5
excerpt: ""
---

One of the things I want to work on is my Linux Sysadmin skills. Linux supports much of cloud native ecosystem, namely Kubernetes. It is helpful to have a certain degree of mastery of this operating system. Linux has many distributions and it is a great idea to toy with different ones. 

I am currently setting up my first homelab. This is where I'm deploying and improving in my Linux skills, as well as other areas. Homelabing is awesome! My first setup is very basic. I was able to gather 4 old laptops and turned them into Ubuntu 22.04 servers. By default, these servers' kernel comes with Kernel-based Virtual Machine (KVM) installed. KVM is a module that turns the kernel into a hypervisor and allows one to create virtual machines.

Virtualization was a game changer in the early 2000s and it continues to underpin much of server provisioning. I could use each server for a single application, but that would render the servers mostly idle and I would have to purchase a very large amount of servers to cover all the services in a basic modern infrastructure. Instead, virtualization allows one to share hardware between competing virtual servers. For these reasons, the list below lies heavily on this technology.

With this setup what are the tasks one can pursue in order to cover much of modern Linux SysAdmin?
1. Enable KVM hosting on each of the servers
2. Create a DNS VM
3. Create a VM with a dhcp daemon
4. Create a LDAP VM
5. Create a Postgres VM
6. Create an Apache webserver VM
7. Create a PfSense VM
8. Create a bastion host VM
9. Expose the Apache webserver to the internet
10. Create a backup system using different hardware and do a live drill of a catasthropic failure
11. Create a VM with a syslog daemon to listen to other servers' input.
12. Automate all VM creation with Terraform
13. Automate all VM configuration with Ansible
14. Destroy your entire infrastructure and recreate automatically it with Terraform and Ansible

There is a lot more one can do, but this is an already large list of tasks and a good starting from which one can build upon.

