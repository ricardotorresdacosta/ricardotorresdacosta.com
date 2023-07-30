---
title: "Basic input-output redirection in Linux"
categories:
  - Linux
  - Red Hat Certified System Administrator Exam
# classes: wide
header:
  teaser: ../assets/images/javier-allegue-barros-C7B-ExXpOIE-unsplash_640x430.jpg
  overlay_image: ../assets/images/javier-allegue-barros-C7B-ExXpOIE-unsplash_5434x3623.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
# excerpt: ""
review: 0
---
Output redirections send output streams of a process to a file while input redirections send the content of a given file to the input stream of a process. See here an explanation on some of the basic input-output operators in Linux. 

`>` is called the **output redirection operator** 
  - when you execute a command followed by `>` and a filename, the output of the command is sent to the specified file instead of being printed on the console. If the file already exists, it will be overwritten. If it doesn't exist, it will be created.  
  
`>>` is the **append redirection operator**
  -  it works similarly to `>`, but instead of overwriting the file, it appends the output of the command to the end of the existing content of the file. If the file does not exist, it will be created.  
  
`|` is the **pipe operator** 
  - it is used to chain multiple commands together, so that the output of one command is used as input to the next command. This is not a redirection operator, no files are involved.
  
`2>` is the **error redirection operator**. 
  - in Linux, there are three standard streams: input (stdin), output (stdout), and error (stderr). Each of these streams is associated with a numerical file descriptor: 0 for stdin, 1 for stdout, and 2 for stderr. By default, both stdout and stderr are printed to the console. But sometimes, you might want to separate normal output and error messages. `2>` is used to redirect error messages to a file or another command. 
  
`&>` operator:
  - this operator redirects both stdout and stderr to the same file.  
   
`<` is the **input redirection operator**. 
  - it's used to send the contents of a file as input to a command. **Instead of using the keyboard to provide input to the stdin file descriptor, you are using a file as input**. For example, to send the contents of `input.txt` as input to sort, you can write: 
    ```bash 
    $ sort < input.txt
    ```
