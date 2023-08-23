---
title: "Identify CPU/memory intensive processes and kill processes in Linux?"
categories:
  - Linux
  - Red Hat Certified System Administrator Exam
# classes: wide
toc: true
header:
  teaser: ../assets/images/markus-winkler-afW1hht0NSs-unsplash_640x426.jpg
  overlay_image: ../assets/images/markus-winkler-afW1hht0NSs-unsplash_1920x1280.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "To identify CPU/Memory intensive processes in Linux, you can use the top command, ps command or the htop command, which is an enhanced version of top."
---

# Identification
To identify CPU/Memory intensive processes in Linux, you can use the top command, ps command or the htop command, which is an enhanced version of top.

## `top` command
You can simply type `top` in your terminal, and it will give you a live scrolling view of the current processes and their CPU/Memory utilization.

## `ps` command
   
You can use the `ps` command along with `aux` and sort to identify the most CPU/Memory intensive processes:
```bash
ps aux --sort=-%cpu
ps aux --sort=-%mem
```
The above commands will sort the processes according to CPU and memory usage respectively.

## `htop` command
If `htop` is installed on your system, you can simply type htop in your terminal. It gives you a more user-friendly and colorful interface compared to top.

# Kill process
Once you've identified the process you want to kill, you can do so with the `kill` command followed by the PID (Process ID), or with the `pkill` command followed by the process name.

For example, if a process has a PID of 1234, you can use the following command to kill it:

```bash
kill 1234
```
If the process does not respond to the kill command, you can use the -9 option (SIGKILL) to forcefully kill the process:

```bash
kill -9 1234
```

Alternatively, if the process name is "example", you can use the following command to kill it:

```bash
pkill example
```