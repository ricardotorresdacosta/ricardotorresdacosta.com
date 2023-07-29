---
title: "A primer on file permissions in Linux"
categories:
  - Linux
toc: true
# classes: wide
header:
  teaser: ../assets/images/linux-file-permissions.jpg
  overlay_image: ../assets/images/linux-file-permissions.jpg
  overlay_filter: 0.5
excerpt: ""
review: 0
---

Understanding and manipulating file and directory permissions is a crucial aspect of Linux system administration. The letters `u`, `g`, `o` stand for User, Group, and Others respectively. `r`, `w`, `x` stand for Read, Write, and Execute permissions respectively.

Here's a primer on how you can list, set, and change these permissions in Linux.

# Viewing File Permissions

You can list the permissions of a file or directory using the ls -l command. Here's how a typical long listing might look:

```bash
-rwxr-xr-x 1 root root 4096 Jul 27 21:34 myfile.txt
```
Here's a breakdown of that listing:

The first character `-` represents the type of the file. `-` means it's a regular file. `d` would indicate a directory.
The next nine characters represent the permissions for the User (`rwx`), Group (`r-x`), and Others (`r-x`).
`rwx` means the owner (User) can read, write, and execute the file.
`r-x` means members of the file's group and others can read and execute, but not write to (modify) the file.

# Changing File Permissions

You can use the `chmod` command to change the permissions of a file. You can do this in one of **two ways**:

## Symbolic method: 

This method involves using u, g, o (User, Group, Other) and r, w, x (Read, Write, Execute), along with operators + (add), - (remove), = (set exactly). For example:

- `chmod u+x myfile.txt` adds execute permission for the user.
- `chmod g-w myfile.txt` removes write permission for the group.
- `chmod o=r myfile.txt` sets the other's permissions to read only.

## Numeric (or octal) method: 

This method involves using numbers to represent permissions: 4 stands for read, 2 for write, and 1 for execute. You can add these numbers together to get combinations of permissions. For example, 7 (4+2+1) stands for read, write, and execute. The order is again User, Group, Other. For example:

- `chmod 700 myfile.txt` gives full permissions to the user, and no permissions to the group and others.
- `chmod 644 myfile.txt` gives read and write permissions to the user, and just read permissions to the group and others.

# Setting Default Permissions

The `umask` command can be used to set the default permissions that new files and directories will receive. **The umask value is subtracted from the maximum permissions to determine the default permission**. The maximum permissions for files are typically set to 666 and for directories to 777. The reason behind this difference is that the execute permission (`x`) has a special meaning for directories in Linux - it controls the access to view the contents of the directory. Files, on the other hand, don't require execute permission unless the file is a program or a script that needs to be executed.

Having a 777 permission on a regular file would mean that anyone could modify and execute the file, which is a considerable security risk. This is why, by convention and for security reasons, files often do not have the execute permission set by default.

As for the `umask` command, it sets the default permissions for the current shell and its child processes, meaning it's a per-process setting, not a global one. If you want to set it permanently for a user, you can add it to the user's shell profile file (like `~/.bashrc` or `~/.bash_profile` for the bash shell).

The `umask` command can't directly set different default permissions for files and directories. Instead, it sets a base permission level, and the actual default permissions are derived from it. However, the system inherently knows that directories require execute permissions to function correctly, so it will automatically handle directories differently from files.

For example, if you set `umask` to 0022, files will have a default permission of 644 (`rw-r--r--`) and directories will have 755 (`rwxr-xr-x`). This is because the system subtracts the `umask` from 666 for files and 777 for directories.
