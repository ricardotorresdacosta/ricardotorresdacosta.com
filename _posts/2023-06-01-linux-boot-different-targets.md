---
title: "Boot systems into different targets manually"
categories:
  - Linux
  - Red Hat Certified System Administrator Exam
# classes: wide
toc: true
header:
  teaser: ../assets/images/ricardo-arce-cY_TCKr5bek-unsplash_640x441.jpg
  overlay_image: ../assets/images/ricardo-arce-cY_TCKr5bek-unsplash_1920x1325.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: "Booting a Linux system into a different target (also known as runlevel in older versions of Linux) can be achieved by using the `systemd` utility. This is a system and service manager for Linux operating systems."
review: 0
---

Booting a Linux system into a different target (also known as runlevel in older versions of Linux) can be achieved by using the `systemd` utility. This is a system and service manager for Linux operating systems.

## Manually switch to a different target
To manually switch to a different target, you use the `systemctl` command followed by the `isolate` command and the name of the target. The `isolate` command will start the target specified and all its dependencies and stop all others. Here's an example:

```bash
sudo systemctl isolate multi-user.target
```
This command will take you to a console-only multi-user mode, which is similar to the traditional runlevel 3.

Here are the common `systemd` targets:

1. `poweroff.target`: Halt the system.
1. `rescue.target`: Single user mode.
1. `multi-user.target`: Multi-user, non-graphical. Users can usually login via multiple consoles or via the network.
1. `graphical.target`: Multi-user, graphical. Typically has all the services of multi-user.target plus a graphical login.
1. `reboot.target`: Reboot
1. `emergency.target`: Emergency shell

## Boot into a different target by default during system boot
If you wish to boot into a different target by default during system boot, you can use `systemctl set-default`. Here is an example:

```bash
sudo systemctl set-default multi-user.target
```
This command sets the system to boot into the multi-user target by default.

To check what target you are currently in, you can use the command `systemctl get-default`.
