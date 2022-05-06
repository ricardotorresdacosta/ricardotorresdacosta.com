---
title: GitOps for Non-Techies
categories:
  - Gitops
---

# WTF is GitOps?

[GitOps is a way of implementing Continuous Deployment for cloud native applications.](https://www.gitops.tech/)

GitOps = Git + Ops

# What is Git? 
Git is the most popular version control system (VCS). The problem VCS tools address is the problem of file sharing, aka parallel editing of files. 
  
  ![image1](/assets/images/gitops_nontechies_1.png)


  There are two standard solutions to this problem:
  1. The lock-modify-unlock solution
   
![image2](/assets/images/gitops_nontechies_2.png)

  2. The copy-modify-merge solution

![image](/assets/images/gitops_nontechies_3.png)
![image](/assets/images/gitops_nontechies_4.png)

 source: [Version Control with Subversion](https://svnbook.red-bean.com/en/1.7/svn.basic.version-control-basics.html)

## How is this implemented these days in the software development world?

![d](/assets/images/gitops_nontechies_5.png)

Copy-modify-merge is the most common solution and is automated with version control tools such as Git. 
1. Multiple teams work in parallel in the same source code. 
2. Who did what and when is tracked. 
3. It allows for simple recovery of previous versions if you mess something up (that is why it's Git is called a version control tool!)
4. Only when there is a conflict, ie, edits overlap on a line basis, is there a need for a manual conflict resolution. 
5. It runs very smoothly. Most developers can't imagine working without it.

## How was it before?
  
Each company had its own practices. They tended to be manual implementations of the lock-modify-unlock and copy-modify-merge solutions. 
One hears stories of those bygone days. Here are some anecdotes from [Quora](https://www.quora.com/How-did-programmers-work-before-version-control-systems-were-created).
- Some companies simply winged it with a lot of praying.
- teams would share tarballs and diff files
- teams would try to work on different parts of the code
- you were afraid of losing source code
- very slow implementation, basic a single version at any time. No way to store the current version or go back to the previous version
- some projects would have a master copy with a single gatekeeper administering it
- some companies had different parts of source code assigned to different developers who were the solely responsible for that
- We had a physical token — a piece of paper with a handwritten note that I have since forgotten — that was passed around. If you needed to edit the shared source file, you figured out who had the token and asked them for it.
- some companies had people whose only job was to merge files, the "librarian".  
- all teams assume it's the latest (hopefully but this is error prone. The tech lead just shared the code on is USB stick (or a floppy disk).
- multiple team develop new features and pray that they won't work on the same section on the code.
- eventually the code has to be merged. Files worked by teams are compared manually with the use of diff files.
- What version are we at? Difficult to say. Let's hope for the best.
- Rollback? No way, Jose! Imagine we just edited our Word document but without tracking enabled
- Furthermore, core piece of work being done by one team, 99 teams have to wait for their work to finish.
- 100 teams, 99 stopped waiting
- Merging was crazy
- 






# What is Ops?

## How does a brand new app or new feature show up on the internet? 
### There are two parts:
  1. Develop it.
  2. Put it wherever you want:
     - Your laptop
     - Your company’s laptop
     - Your company’s internal server(s) and network
     - Your client’s internal server(s) and network 
     - Online


### Ops is short for Operations and (among other things) concerns the second part: putting your application somewhere, aka deployment.

# How to Deploy to Production? From Traditional Ops to GitOps
## Manually
  - Often on physical servers
  - OS, tools and dependencies all installed in server
  - Servers are treated like pets that have to be actively managed
  - Each release is a high risk event
  - Ops staff would work at night time or weekends to release
  - Files would be manually moved into production environment
  - Chaos, fear, anger, configuration
## Some Automated Ops before VCS
  - Automation code with scripts or automation tools
  - Creates pipelines to automatically deploy new application versions into different environments up to production
  - Challenges regarding managing configuration of deployment files, unclear which ones are current, difficult to rollback to previous versions --> same issues as in development before the adoption of version control systems
## GitOps
  
### VCS

  - Versions not just application code, but all code, ie, also configuration and infrastructure
  - Makes things simpler, lower the stakes of releases, easier to track changes and do rollbacks

### Automation on Steroids
  - Works with platform that automates a lot of stuff (eg. AWS, Kubernetes)
  - Ultimately, as soon as changes to the source code are commited, they are reflected in   
  - Deploy Faster More Often
  
   ![image](/assets/images/gitops_nontechies_6.png)



