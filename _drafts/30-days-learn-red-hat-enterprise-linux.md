---
title: "30 Days Challenge: Learn Red Hat Enterprise Linux"
categories:
  - Red Hat
  - Linux
  - Ansible
#toc: true
# classes: wide
header:
  #teaser: ../assets/images/lenny-kuhne-jHZ70nRk7Ns-unsplash_640x426.jpg
  #overlay_image: ../assets/images/lenny-kuhne-jHZ70nRk7Ns-unsplash_large.jpg
  overlay_filter: 0.5
excerpt: ""
---
Welcome to the first day of this 30 days Challenge. My goal is to help anyone interested in learning more about Red Hat Enterprise Linux

This challenge will have the following structure (onion peeling):
1. Research the field and create a list of the topics to cover
1. Iteration 1: go over all the topics from a bird's eye view perspective, clarifying all terminology that may be unknown
1. Iteration 2: discuss the theory in each topic (WHAT? WHY?)
1. Iteration 3: define exercises/demos for each topic and discuss their rationale (HOW?)
1. Iteration 4: execute and record the exercises/demos (HOW?)


# Red Hat Certified System Administrator (RHCSA)
From Red Hat's [RHCSA exam objectives page](https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam?section=objectives):

## Understand and use essential tools
- Access a shell prompt and issue commands with correct syntax
- Use input-output redirection (`>`, `>>`, `|`, `2>`, etc.)
- Use grep and regular expressions to analyze text
- Access remote systems using SSH
- Log in and switch users in multiuser targets
- Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2
- Create and edit text files
- Create, delete, copy, and move files and directories
- Create hard and soft links
- List, set, and change standard ugo/rwx permissions
- Locate, read, and use system documentation including man, info, and files in /usr/share/doc
## Create simple shell scripts
- Conditionally execute code (use of: if, test, [], etc.)
- Use Looping constructs (for, etc.) to process file, command line input
- Process script inputs ($1, $2, etc.)
- Processing output of shell commands within a script
## Operate running systems
- Boot, reboot, and shut down a system normally
- Boot systems into different targets manually
- Interrupt the boot process in order to gain access to a system
- Identify CPU/memory intensive processes and kill processes
- Adjust process scheduling
- Manage tuning profiles
- Locate and interpret system log files and journals
- Preserve system journals
- Start, stop, and check the status of network services
- Securely transfer files between systems
## Configure local storage
- List, create, delete partitions on MBR and GPT disks
- Create and remove physical volumes
- Assign physical volumes to volume groups
- Create and delete logical volumes
- Configure systems to mount file systems at boot by universally unique ID (UUID) or label
- Add new partitions and logical volumes, and swap to a system non-destructively
## Create and configure file systems
- Create, mount, unmount, and use vfat, ext4, and xfs file systems
- Mount and unmount network file systems using NFS
- Configure autofs
- Extend existing logical volumes
- Create and configure set-GID directories for collaboration
- Diagnose and correct file permission problems
## Deploy, configure, and maintain systems
- Schedule tasks using at and cron
- Start and stop services and configure services to start automatically at boot
- Configure systems to boot into a specific target automatically
- Configure time service clients
- Install and update software packages from Red Hat Network, a remote repository, or from the local file system
- Modify the system bootloader
## Manage basic networking
- Configure IPv4 and IPv6 addresses
- Configure hostname resolution
- Configure network services to start automatically at boot
- Restrict network access using firewall-cmd/firewall
## Manage users and groups
- Create, delete, and modify local user accounts
- Change passwords and adjust password aging for local user accounts
- Create, delete, and modify local groups and group memberships
- Configure superuser access
## Manage security
- Configure firewall settings using firewall-cmd/firewalld
- Manage default file permissions
- Configure key-based authentication for SSH
- Set enforcing and permissive modes for SELinux
- List and identify SELinux file and process context
- Restore default file contexts
- Manage SELinux port labels
- Use boolean settings to modify system SELinux settings
- Diagnose and address routine SELinux policy violations
## Manage containers
- Find and retrieve container images from a remote registry
- Inspect container images
- Perform container management using commands such as podman and skopeo
- Build a container from a Containerfile
- Perform basic container management such as running, starting, stopping, and listing running containers
- Run a service inside a container
- Configure a container to start automatically as a systemd service
- Attach persistent storage to a container


# Red Hat Certified Engineer (RHCE)
From Red Hat's [RHCE exam objectives page](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam-red-hat-enterprise-linux-9?section=objectives):


## Be able to perform all tasks expected of a Red Hat Certified System Administrator
- Understand and use essential tools
- Operate running systems
- Configure local storage
- Create and configure file systems
- Deploy, configure, and maintain systems
- Manage users and groups
- Manage security

## Understand core components of Ansible
- Inventories
- Modules
- Variables
- Facts
- Loops
- Conditional tasks
- Plays
- Handling task failure
- Playbooks
- Configuration files
- Roles
- Use provided documentation to look up specific information about Ansible modules and commands

## Use roles and Ansible Content Collections
- Create and work with roles
- Install roles and use them in playbooks
- Install Content Collections and use them in playbooks
- Obtain a set of related roles, supplementary modules, and other content from content collections, and use them in a playbook.

## Install and configure an Ansible control node
- Install required packages
- Create a static host inventory file
- Create a configuration file
- Create and use static inventories to define groups of hosts

## Configure Ansible managed nodes
- Create and distribute SSH keys to managed nodes
- Configure privilege escalation on managed nodes
- Deploy files to managed nodes
- Be able to analyze simple shell scripts and convert them to playbooks

## Run playbooks with Automation content navigator
- Know how to run playbooks with Automation content navigator
- Use Automation content navigator to find new modules in available Ansible Content Collections and use them
- Use Automation content navigator to create inventories and configure the Ansible environment

## Create Ansible plays and playbooks
- Know how to work with commonly used Ansible modules
- Use variables to retrieve the results of running a command
- Use conditionals to control play execution
- Configure error handling
- Create playbooks to configure systems to a specified state

## Automate standard RHCSA tasks using Ansible modules that work with:
- Software packages and repositories
- Services
- Firewall rules
- File systems
- Storage devices
- File content
- Archiving
- Task scheduling
- Security
- Users and groups

## Manage content
- Create and use templates to create customized configuration files
- Use Ansible Vault in playbooks to protect sensitive data