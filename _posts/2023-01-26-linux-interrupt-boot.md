---
title: "Interrupt the boot process in order to gain access to a system in Linux"
categories:
  - Linux
  - Red Hat Certified System Administrator Exam
# classes: wide
toc: true
header:
  teaser: ../assets/images/michael-dziedzic-0W4XLGITrHg-unsplash_640x481.jpg
  overlay_image: ../assets/images/michael-dziedzic-0W4XLGITrHg-unsplash_1920x1443.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "The ability to interrupt the boot process to gain access to a system is a valuable skill for system administrators in several scenarios. These are some use-cases where it proves to be highly useful:"
---

# Why do I care? Use cases

The ability to interrupt the boot process to gain access to a system is a valuable skill for system administrators in several scenarios. These are some use-cases where it proves to be highly useful:

## Resetting Root Password
One of the most common use-cases is when the root password is forgotten or lost. In such scenarios, interrupting the boot process allows you to gain access to the system and reset the root password.

## System Recovery 
If a system fails to boot normally due to a configuration error or system file corruption, the ability to interrupt the boot process can allow an administrator to boot into a minimal environment. From there, they can repair the faulty configuration or restore the necessary system files.

## Troubleshooting 
By interrupting the boot process and gaining access to a system, you can troubleshoot kernel or boot loader problems that are preventing the system from booting normally. You can modify kernel parameters, specify a different init system, or perform other low-level operations to diagnose and fix the issue.

## Security Auditing
It is crucial for a security auditor to understand how unauthorized users might gain access to a system. By learning how to interrupt the boot process, an auditor can better understand potential vulnerabilities and design countermeasures.

## Education and Experimentation
For learners and experimenters, understanding how to interrupt the boot process is a great way to learn about the lower levels of the Linux system. This knowledge can be beneficial in gaining a deeper understanding of how the system works, which can be applied in many areas of system administration, development, and troubleshooting.

# How to do it?

Interrupting the boot process to gain access to a system is a fundamental skill in RHEL 8 administration, especially when it comes to recovering the system or resetting the root password. Here is a general process on how to do it:

1. Restart the System: Begin by restarting your RHEL 8 system.

2. Interrupt the Boot Loader: As soon as the GRUB 2 boot menu appears, press the 'e' key to interrupt the boot process and edit the boot entries.

3. Modify Boot Entries: Look for the line starting with 'linux16' or 'linux'. This line contains the kernel and its parameters. Navigate to the end of this line.

4. Enter Single User Mode: At the end of this line, append the parameter 'rd.break' or 'single'. The 'rd.break' will break just before control is transferred from the initramfs to the actual system. 'Single' will take you to the single-user mode which has fewer capabilities.

5. Reboot the System: Press 'Ctrl+X' or 'F10' to reboot the system. The system will now boot into the emergency mode or single-user mode.

6. Remount the File System: In the case of 'rd.break', you'll need to remount the sysroot file system in read/write mode with this command:
```bash
mount -o remount,rw /sysroot
```
7. Chroot into Sysroot: Enter a chroot jail, where /sysroot is treated as the root of the file system hierarchy:
```bash
chroot /sysroot
```
8. Change the Root Password: You can now change the root password using the passwd command:
```bash
passwd
```

9. Relabel the File System: If you're running SELinux, you also need to relabel the file system to avoid potential permission issues:

```bash
touch /.autorelabel
```

10. Exit and Reboot: Exit the chroot environment by typing 'exit', and then reboot the system with 'reboot'.

Be aware that these steps could be different based on the specific system settings and configurations.