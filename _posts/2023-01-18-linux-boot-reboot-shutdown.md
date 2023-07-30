---
title: "Boot, reboot, and shut down a system normally"
categories:
  - Linux
  - Shell/Bash
# classes: wide
toc: true
header:
  teaser: ../assets/images/david-clode-cUGNFbxxD1E-unsplash_640x424.jpg
  overlay_image: ../assets/images/david-clode-cUGNFbxxD1E-unsplash _1920x1273.jpg
  overlay_filter: 0.5
excerpt: ""
review: 0
---
# Commands to Reboot the System

1. `reboot`: This command is a simple, direct way to reboot your system.

1. `systemctl reboot`: This command uses the systemctl command (part of the `systemd` system and service manager), to reboot the system.

1. `shutdown -r now`: The `-r` option tells the shutdown command to reboot the system once it has shut down. The now argument specifies that the shutdown/reboot should happen immediately.

1. `init 6`: The `init` command with the argument 6 tells the system to reboot. This is a SysVinit command; in a system with `systemd` (like RHEL 8), this will be redirected to a `systemd` equivalent.

1. `telinit 6`: Similar to `init 6`, `telinit` is used to change the SysVinit runlevel. `telinit 6` will reboot the system. In a `systemd` system, this command is equivalent to systemctl reboot.

# Commands to Shutdown the System

1. `halt`: This command will halt the system but may not power it down.

1. `systemctl halt`: This systemctl command halts the system. The behavior of halt varies somewhat depending on your system configuration, but generally, it will stop all processes but may not power down the machine.

1. `shutdown -h now`: The -h option tells the shutdown command to halt the system (i.e., to stop all processes). The now argument specifies that the halt should happen immediately.

1. `init 0`: The `init` command with the argument 0 tells the system to halt. Again, this is a SysVinit command that is redirected to a systemd equivalent in systems with systemd.

1. `telinit 0`: Like `init 0`, `telinit 0` will halt the system. In a systemd system, this command is equivalent to systemctl halt.

# Commands to Switch Off the System

1. `poweroff`: This command will power off the system.

1. `systemctl poweroff`: This systemctl command will power off the system.

Note: In some contexts, `shutdown` and `power off` are used interchangeably. In others, `shutdown`` refers to stopping all processes, while `power off`` refers to actually turning off the power to the machine. The behavior of these commands can sometimes vary depending on your specific system configuration.

# Why so many options that seem to do the same?

The variety of options is largely due to the evolution of Unix-like systems and the introduction of different service management systems over time. Let's break it down:

**Compatibility**: Over the years, Unix and Linux have had different systems to manage services and system states. `init` and its corresponding runlevels were used in SysVinit and Upstart systems, while `systemd` uses `systemctl` and has its own set of commands. In order to ensure backward compatibility with scripts and user habits, the old commands still work and are aliased to the new ones in systems using systemd.

**Flexibility**: While some commands may seem to do the same thing on the surface, they can behave differently in certain situations, providing flexibility for users who may want a system to respond in a certain way. For example, `halt` typically stops all processes and halts the system but does not power it off, while `poweroff` halts the system and then turns off the power.

**Ease of Use and Readability**: Some commands are more intuitive and easier to remember than others. For example, `systemctl reboot` is more descriptive and easier to understand at a glance than `init 6`.

**Granularity**: Some commands provide more control over the details of the operation. For example, `shutdown` can be scheduled for a future time, and can also provide users with an advance warning and the reason for the shutdown.

