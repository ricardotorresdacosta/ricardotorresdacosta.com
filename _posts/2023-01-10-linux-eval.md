---
title: "What, why, how is `eval` command in shell?"
categories:
  - Linux
  - Shell/Bash
toc: true
# classes: wide
header:
  teaser: ../assets/images/linux_eval.jpg
  overlay_image: ../assets/images/linux_eval.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
excerpt: "`eval` is a built-in command in most Unix-like operating systems, such as Linux. It comes from the `sh` (Bourne shell) programming language, which was one of the original Unix shells. The `eval` command is included in all POSIX-compliant shells, which means it's available in modern shells like `bash`, `zsh`, and others."
review: 0
---

# What is `eval`?
`eval` is a built-in command in most Unix-like operating systems, such as Linux. It comes from the `sh` (Bourne shell) programming language, which was one of the original Unix shells. The `eval` command is included in all POSIX-compliant shells, which means it's available in modern shells like `bash`, `zsh`, and others.

**KEY idea**:The purpose of `eval` is to take its arguments, concatenate them into a single command, and then execute that command. In other words, it is used to construct and execute command lines dynamically.

The existence of `eval` is due to the need for more dynamic shell scripting. **Sometimes, it is useful to construct a command line piece-by-piece, based on conditions that aren't known until the script is run. `eval` enables this kind of dynamic scripting**.

## Use Case 1: Dynamically Setting Variable Names

```bash
for i in 1 2 3
do
  eval  VAR$i=$i
done

echo $VAR1  # Outputs 1
echo $VAR2  # Outputs 2
echo $VAR3  # Outputs 3
```

In this script, `eval`  is used to dynamically create the variable names VAR1, VAR2, and VAR3, each containing the corresponding value. Without the `eval` keyword, the shell would not be able to **evaluate**, ie substitute, the $i variable with 1, 2 and 3.

## Use Case 2: Executing a Command Stored in a String

```bash
command="ls -l"
eval $command
```
Here, `eval`  is used to execute a command that was stored in a string. This can be helpful in cases where the command to be executed is generated dynamically.

## Use Case 3: Handling Indirect References

```bash
a='hello'
b='a'
eval echo \$$b  # Outputs 'hello'
```

In this example, `eval` is used to print the value of a variable when the name of the variable is stored in another variable.


# How would these use cases be implemented if `eval` did not exist?

You can replicate some of the functionality of `eval` using other commands or features of the shell, although it may be more complex or less efficient. Here are examples corresponding to the previous use cases, done without using `eval`:

## Use Case 1: Dynamically Setting Variable Names

Bash 4.3 introduced "namerefs" or "reference variables" which can be used for indirection:

```bash
for i in 1 2 3
do
   declare VAR$i=$i
   declare -n ref=VAR$i
   echo ${ref}
done
```

## Use Case 2: Executing a Command Stored in a String

The preferred way to store and execute commands isn't with a plain string, but with a function or an array. However, if you have a string, you can use the `bash -c` command:

```bash
command="ls -l"
bash -c "$command"
```

## Use Case 3: Handling Indirect References

Bash provides a feature called "variable indirection" which allows you to access the value of a variable whose name is stored in another variable:

```bash
a='hello'
b='a'
indirect="${!b}"
echo "$indirect"  # Outputs 'hello'
```
