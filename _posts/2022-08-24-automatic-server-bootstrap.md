---
title: "How to automate the configuration of your homelab servers?"
categories:
  - Homelab
  - Linux
  - Ansible
toc: true
# classes: wide
header:
  teaser: ../assets/images/lenny-kuhne-jHZ70nRk7Ns-unsplash_640x426.jpg
  overlay_image: ../assets/images/lenny-kuhne-jHZ70nRk7Ns-unsplash_large.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: ""
---

A goal I always have in mind is to automate as much as possible what I do. That's the case for sure on my homelab and I have no problem erring on the overkill. It's fun and it's a great learning experience. In the days of Infrastructure as Code, server provisioning and configuration is all the rage. The first automation I did in my homelab was to automate the configuration of my Ubuntu servers after having them installed manually on the machines. This is what I am going over in this post. The configuration settings I'm automating are simple, however, they are labour intensive if done manually. After the first time, *nobody ain't got time for that*.

## My hardware setup

I have three old laptops and a switch connecting them. The details are as follows:
- Asus Intel(R) Core(TM) i5-3337U CPU @ 1.80GHz, 64-bit, 4GiB RAM, Ubuntu 22.04 installed
- Fujitsu Genuine Intel(R) CPU T2130 @ 1.86GHz, 32-bit, 1013MiB RAM, Ubuntu 16.04 installed
- Asus Intel(R) Core(TM)2 CPU T5600 @ 1.83GHz, 62-bit, 2944MiB RAM, Ubuntu 22.04 installed
- TP-Link TL-SG105E Gigabit Switch


## My Ansible playbooks

Ansible is my favourite configuration automation tool. A big difference with respect to Chef or Puppet is that no agents have to be installed in the controlled nodes, the only requirement is for a SSH connection to be possible between them and the control node. Do check its [documentation](https://docs.ansible.com/ansible/latest/). It's very complete and informative. After creating a folder for my Ansible project, there are three key files that I will go over: `ansible.cfg`, `inventory` and the playbook itself which in this case I called `servers_bootstrap.yml`.

`ansible.cfg` is the place where one lists relevant playbook-wide variables. In this case, I listed the location of the inventory file, of the ansible private key file (which does not yet exist) and an option that is necessary for some edge cases to function.

```
./ansible.cfg
[defaults]
inventory = inventory
private_key_file = ~/.ssh/ansible
host_key_checking = false
```

The inventory file is the place where one lists the nodes Ansible will be talking to as well as relevant node-specific variables.
```
#./inventory
[servers]
rita-asus
asus
fujitsu
```

Finally, the larger file is the `servers_bootstrap.yml`. The plays and tasks roughly do the following:
1. create private and public keys on the control node, both for the default user (here `ric`) and the ansible user (aptly named `ansible` by me),
2. update repositories on the controlled nodes,
3. create ansible user on controlled nodes and deploy the created public keys to their set of SSH Authorized Keys,
4. add ansible user to `sudoers`
5. disallow SSH root access and password authentication

```yaml
#./servers_bootstrap.yml
---

- hosts: localhost
  gather_facts: no
  name: localhost pre_tasks
  connection: local
  pre_tasks:

  - name: create personal private and public key on control machine
    command: ssh-keygen -t ed25519 -f /home/ric/.ssh/homelab_servers -C "homelab_servers" -N ""
    args:
      creates: /home/ric/.ssh/homelab_servers

  - name: create ansible private and public key on control machine
    command: ssh-keygen -t ed25519 -f /home/ric/.ssh/ansible -C "ansible" -N ""
    args:
      creates: /home/ric/.ssh/ansible

  - name: remove previous references of homelab_servers keys for manual ssh
    shell: sed -i '/Host {{ item }}/,/^$/d' ~/.ssh/config
    loop: "{{ groups['servers'] }}" 

  - name: add new references for manual ssh
    ansible.builtin.blockinfile:
      path: ~/.ssh/config
      marker: ""
      block: |
        Host {{item}}
           PreferredAuthentications publickey,password
           IdentityFile ~/.ssh/homelab_servers
           Hostname {{ item }}
    loop: "{{ groups['servers'] }}" 

############################################

- hosts: all
  gather_facts: no
  remote_user: ric
  become: true
  pre_tasks:  
  - name: update repositories
    tags: always
    package:
      update_cache: yes

############################################

- hosts: all
  gather_facts: no
  remote_user: ric
  name: create ansible user and send keys to hosts
  become: true
  tasks:

  - name: create ansible user
    tags: always
    user: 
      name: ansible
      groups: root

  - name: set authorized key for personal user taken from file
    authorized_key:
      user: ric
      state: present
      key: "{{ lookup('file', '/home/ric/.ssh/homelab_servers.pub') }}"

  - name: set authorized key for ansible user taken from file
    authorized_key:
      user: ansible
      state: present
      key: "{{ lookup('file', '/home/ric/.ssh/ansible.pub') }}"

  - name: Add user ansible to sudoers
    lineinfile:
       path: /etc/sudoers
       regexp: "^ansible ALL"
       line: "ansible ALL=(ALL) NOPASSWD: ALL"
       state: present

  - name: Disallow root SSH access
    lineinfile:
       dest: /etc/ssh/sshd_config
       regexp: "^PermitRootLogin"
       line: "PermitRootLogin no"
       state: present
    notify:
       - restart sshd

  - name: Disallow SSH password authentication
    lineinfile:
       dest: /etc/ssh/sshd_config
       regexp: "^PasswordAuthentication"
       line: "PasswordAuthentication no"
       state: present
    notify:
      - restart sshd

  handlers:
  - name: restart sshd
    service: 
      name: sshd
      state: restarted

```

This set of playbooks should run immediately after a new Ubuntu installation. The command to run is `ansible-playbook servers_bootstrap.yml --ask-become-pass --ask-pass -vvv`. Such long command is necessary because `--ask-pass` asks for the login password (otherwise it assumes we have a valid private key, which we don't after a fresh installation), `--ask-become-pass` asks for the password for privilege escalation and `-vvv` means verbose which helps with debugging. 

With this automation, what before would take one or two very tedious hours, now runs in under a minute. Given Ansible idempotency, this file can be run multiple times and it doesn't affect the nodes state. This is particularly useful for the case where one node has to be reset and this can simply be run without fear of affecting the other nodes.

After this bootstrap, one is ready to manually `ssh <NODE_NAME>` in a secure way with no need for a password as well as run ansible commands in the same fashion. 

