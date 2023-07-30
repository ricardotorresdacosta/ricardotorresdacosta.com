---
title: "How I backup my personal files"
header:
  teaser: assets/images/personal-backups/jandira-sonnendeck-AcW1ZwD-qC0-unsplash.jpg
  overlay_image: assets/images/personal-backups/jandira-sonnendeck-AcW1ZwD-qC0-unsplash.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: ""
categories:
  - Tips
  - Personal Organization
  - Shell/Bash
toc: true
---

A topic I struggled with for many years was how to back up my personal files. This took place before knowing about the wonders of version control. In those dark days, I would make a backup of the state of my hard drive on a given date. Sometime later I would do another copy, and so on. After a few times, I would start deleting the older folders. This was a manual, clunky and error-prone approach. Invariably, the weakness of this process would lead me to do backups very rarely and even stop it altogether.

This all changed once I started dedicating more time to computers. In particular, one day I found out about [Rsync](https://rsync.samba.org/). It's a tool I adore which synchronizes local and remote directories. While not a version control system per se, it has some similarities with one. It only transfers the parts that are missing on the destination vis-à-vis the source. These days, I attach an external hard drive and run a simple rsync command on a regular basis. And no more thinking is involved. I could automate this process in its entirety, either using a Cloud storage resource or connecting my external hard drive to my home wifi. However, my suspicious self prefers to use a dumb hard drive to reduce the attack surface to any potential threats, even at the expense of having to physically plug it into my laptop.

The exact command I use to execute the synchronization is the following 

```bash
$ sudo rsync -aivP --delete-after /media/ric/root/ \
> media/ric/TOSHIBA\ EXT/root \
> --log-file=/media/ric/root/scripts/rsync/toshiba-last.log
```

I have it in a bash file which I call whenever I want to synchronize my local machine's hard drive at `/media/ric/root/` with my Toshiba's external hard drive which I mount at `/media/ric/TOSHIBA\ EXT/root`. With some help from the man pages, the explanation of the flags I use is as follows:
- `--archive`, `-a`            archive mode includes a number of common options all in one. In particular, it preserves timestamps, performs a recursive copy, keeps all file and directory permissions, preserves owner and group information, and copies any symbolic links
- `--itemize-changes`, `-i`    output a change-summary for all updates, ie, it tells you what was done to each file
- `-v`                         verbose :)
- `-P`                         keeps partially transferred files and shows progress during the transfer
- `--log-file=FILE`            this is the location where the logs from everything that is done are stored

Hope you find this useful. It made me much happier and more relaxed in my managing of personal files. No more crawling for hours trying to find where I put the photos from 2005 at King's Head pub!