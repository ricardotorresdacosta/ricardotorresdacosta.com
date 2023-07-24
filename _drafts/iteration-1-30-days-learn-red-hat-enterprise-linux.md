---
title: "Iteration 1 - 30 Days Challenge: Learn Red Hat Enterprise Linux"
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


# Red Hat Certified System Administrator (RHCSA)
From Red Hat's [RHCSA exam objectives page](https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam?section=objectives):

## Understand and use essential tools
### Access a shell prompt and issue commands with correct syntax
- makes sense when starting from GUI, otherwise one usually uses it directly
- basic commands: pwd, ls, ls -l
- different types of shells
  - login shell (settings in `~/.bashrc`)
  - global shell settings in `/etc/bashrc`
### Use input-output redirection (`>`, `>>`, `|`, `2>`, etc.)
- `>` is called the **output redirection operator** 
  - when you execute a command followed by `>` and a filename, the output of the command is sent to the specified file instead of being printed on the console. If the file already exists, it will be overwritten. If it doesn't exist, it will be created.
- `>>` is the **append redirection operator**
  -  it works similarly to `>`, but instead of overwriting the file, it appends the output of the command to the end of the existing content of the file. If the file does not exist, it will be created.
- `|` is the **pipe operator** 
  - it is used to chain multiple commands together, so that the output of one command is used as input to the next command.
- `2>` is the **error redirection operator**. 
  - in Linux, there are three standard streams: input (stdin), output (stdout), and error (stderr). Each of these streams is associated with a numerical file descriptor: 0 for stdin, 1 for stdout, and 2 for stderr. By default, both stdout and stderr are printed to the console. But sometimes, you might want to separate normal output and error messages. `2>` is used to redirect error messages to a file or another command.
- `&>` operator:
  - this operator redirects both stdout and stderr to the same file. 
- `<` is the **input redirection operator**. 
  - it's used to send the contents of a file as input to a command. For example, to send the contents of input.txt as input to sort, you can write: 
    ```bash 
    $ sort < input.txt
    ```
### Use grep and regular expressions to analyze text
- `grep` stands for Global Regular Expression Print. `grep` is designed for searching and matching text patterns in files or standard input.
- regular expressions, often abbreviated as "regex" or "regexp," are sequences of characters that form a search pattern. They provide a powerful and flexible way to match and manipulate text in strings or files. 
### Access remote systems using SSH
- it's a protocal that allows for accessing remote systems with a shell authentication details (username and password or public/private key)
### Log in and switch users in multiuser targets
- What is **multiuser targets?**  
  It is one of of the linux run levels, specifically run level 3, ie Multiuser mode with networking.
- What are **run levels**?
  Run levels are derived from the boot process of the OS. They determine what the system can and cannot do, ie its operational state. When a system is booted, different routines can be followed to produce different operational states. There are 7 operational states, aka run levels, aka modes of operation:

  0. Halt: System is shutdown.
  0. Single-user mode: Used for maintenance and administrative tasks, allowing only the root user to log in.
  0. Multiuser mode without networking: Used when the system doesn't require network access but needs multiuser support.
  0. Multiuser mode with networking: The standard multiuser mode with full networking capabilities.
  0. Not used: Administrators can define their custom runlevel if needed.
  0. Graphical multiuser mode: Similar to runlevel 3 but starts the system with a graphical user interface (GUI).
  0. Reboot: System is rebooted.
  
### Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2
- `tar` stands for *Tape Archive*. It archives files and directories into a single file. It does **not** compress data, simply combines multiple files into one while keeping their directory structure.
- `star` is similar to `tar` but with more features. However, it is not widely used.
- `gzip` stands for *GNU zip* and it is a compression tool used to compress a **single** file.
- `bzip2` is similar do `gzip`. It uses a different compression algorithm that delivers better compression ratios with the trade-off of slightly slower compression and decompression times.
### Create and edit text files
- The easiest ways are to use the text editors commonly found in Linux: Vi (I use Vim, aka Vi Improved) or Nano to create and edit text files.
### Create, delete, copy, and move files and directories
- The commands for files are:
  - `$ touch filepath`, where `filepath` can be for example `/home/user1/example_file.txt`
  - `$ rm filepath`
  - `$ cp src_filepath dst_filepath`
  - `$ mv src_filepath dst_filepath`  

- The commands for directories are:
  - `$ mkdir dirpath`, where `dirpath` can be for example `/home/user1/example_dir`
  - `$ rm -r dirpath`
  - `$ cp -r src_dirpath dst_dirpath`
  - `$ mv -r dirpath`


### Create hard and soft links
- Hard links create multiple directory entries that all refer to the same **inode** and share the same data blocks on the disk.  All hard links to a file are **essentially the same file**, and there is no distinction between the original file and its hard links. If the original file is deleted, the hard link will still exist and maintain access to the file's data. The data will only be removed once all hard links to the file are deleted. Hard links do not occupy additional disk space. All hard links share the same data blocks on the disk.
- Soft links (aka symbolic links, aka symlinks) create a new file that acts as a pointer to the target file or directory. If you access a soft link, it will redirect you to the target file or directory. If the target file or directory of a soft link is deleted or moved, the soft link becomes a "dangling symlink," and attempting to access it will result in a broken link. Soft links occupy a small amount of disk space (equal to the path length) to store the link information.
### List, set, and change standard ugo/rwx permissions
### Locate, read, and use system documentation including man, info, and files in /usr/share/doc
## Create simple shell scripts
### Conditionally execute code (use of: if, test, [], etc.)
### Use Looping constructs (for, etc.) to process file, command line input
### Process script inputs ($1, $2, etc.)
### Processing output of shell commands within a script
## Operate running systems
### Boot, reboot, and shut down a system normally
### Boot systems into different targets manually
### Interrupt the boot process in order to gain access to a system
### Identify CPU/memory intensive processes and kill processes
### Adjust process scheduling
### Manage tuning profiles
### Locate and interpret system log files and journals
### Preserve system journals
### Start, stop, and check the status of network services
### Securely transfer files between systems
## Configure local storage
### List, create, delete partitions on MBR and GPT disks
### Create and remove physical volumes
### Assign physical volumes to volume groups
### Create and delete logical volumes
### Configure systems to mount file systems at boot by universally unique ID (UUID) or label
### Add new partitions and logical volumes, and swap to a system non-destructively
## Create and configure file systems
### Create, mount, unmount, and use vfat, ext4, and xfs file systems
### Mount and unmount network file systems using NFS
### Configure autofs
### Extend existing logical volumes
### Create and configure set-GID directories for collaboration
### Diagnose and correct file permission problems
## Deploy, configure, and maintain systems
### Schedule tasks using at and cron
### Start and stop services and configure services to start automatically at boot
### Configure systems to boot into a specific target automatically
### Configure time service clients
### Install and update software packages from Red Hat Network, a remote repository, or from the local file system
### Modify the system bootloader
## Manage basic networking
### Configure IPv4 and IPv6 addresses
### Configure hostname resolution
### Configure network services to start automatically at boot
### Restrict network access using firewall-cmd/firewall
## Manage users and groups
### Create, delete, and modify local user accounts
### Change passwords and adjust password aging for local user accounts
### Create, delete, and modify local groups and group memberships
### Configure superuser access
## Manage security
### Configure firewall settings using firewall-cmd/firewalld
### Manage default file permissions
### Configure key-based authentication for SSH
### Set enforcing and permissive modes for SELinux
### List and identify SELinux file and process context
### Restore default file contexts
### Manage SELinux port labels
### Use boolean settings to modify system SELinux settings
### Diagnose and address routine SELinux policy violations
## Manage containers
### Find and retrieve container images from a remote registry
### Inspect container images
### Perform container management using commands such as podman and skopeo
### Build a container from a Containerfile
### Perform basic container management such as running, starting, stopping, and listing running containers
### Run a service inside a container
### Configure a container to start automatically as a systemd service
### Attach persistent storage to a container


# Red Hat Certified Engineer (RHCE)
From Red Hat's [RHCE exam objectives page](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam-red-hat-enterprise-linux-9?section=objectives):


## Be able to perform all tasks expected of a Red Hat Certified System Administrator
### Understand and use essential tools
### Operate running systems
### Configure local storage
### Create and configure file systems
### Deploy, configure, and maintain systems
### Manage users and groups
### Manage security

## Understand core components of Ansible
### Inventories
### Modules
### Variables
### Facts
### Loops
### Conditional tasks
### Plays
### Handling task failure
### Playbooks
### Configuration files
### Roles
### Use provided documentation to look up specific information about Ansible modules and commands

## Use roles and Ansible Content Collections
### Create and work with roles
### Install roles and use them in playbooks
### Install Content Collections and use them in playbooks
### Obtain a set of related roles, supplementary modules, and other content from content collections, and use them in a playbook.

## Install and configure an Ansible control node
### Install required packages
### Create a static host inventory file
### Create a configuration file
### Create and use static inventories to define groups of hosts

## Configure Ansible managed nodes
### Create and distribute SSH keys to managed nodes
### Configure privilege escalation on managed nodes
### Deploy files to managed nodes
### Be able to analyze simple shell scripts and convert them to playbooks

## Run playbooks with Automation content navigator
### Know how to run playbooks with Automation content navigator
### Use Automation content navigator to find new modules in available Ansible Content Collections and use them
### Use Automation content navigator to create inventories and configure the Ansible environment

## Create Ansible plays and playbooks
### Know how to work with commonly used Ansible modules
### Use variables to retrieve the results of running a command
### Use conditionals to control play execution
### Configure error handling
### Create playbooks to configure systems to a specified state

## Automate standard RHCSA tasks using Ansible modules that work with:
### Software packages and repositories
### Services
### Firewall rules
### File systems
### Storage devices
### File content
### Archiving
### Task scheduling
### Security
### Users and groups

## Manage content
### Create and use templates to create customized configuration files
### Use Ansible Vault in playbooks to protect sensitive data