# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/pflorezh/lab_vision.git

2.  What is the output of the ``cal`` command?

It displays a calendar of the current month.

# Homework Questions

1.  What is the ``grep``command?
    >   It's a command used to search for a word or a string of characters in a file(s).

2.  What is a *makefile*?
    >   It's a text file containing the rules that the *make* program uses to compile/manage programs.

3.  What is *git*?
    >   It's a system that allows for many software developers to work simultaneously on a project. It focuses on the speed and data integrity of the project.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   It excludes directories from the search done with the 'find' command.
Ex: find . -name temp -prune
This command prints a list of files and directories with the name temp, but -prune won't allow the find command to access the directories listed with the temp name in order to find more tmp named files inside of them.

5.  Where is the file ``xxxxxx``
    >   An XXXXXX file is a partial download file or temporary file. These are normally found on a folder named temp in the main directory.

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   The files can be found using the command:  find directories -name pattern, where directories is /usr/src and pattern is gnu. The number of files can be counted adding the wc command at the end (656).

7.  How many files contain ``gpl`` inside in ``/usr/src``
    >   The files can be found using the command: grep -l name directory, where name is "gpl" and directory is /usr/src. This search produces a list of names of the files containing gpl, and the elements can be counted by adding the wc command at the end (51).

8.  What does the ``cut`` command do?
    >   It exctracts a section from a file. The section to be removed can be determined by different classifications such as bytes, charaters and fields.

9.  What does the ``wget`` command do?
    >   It allows the download of a file from the Web. (Protocols supported: HTTP, HTTPS, FTP).

10.  What does the ``diff`` command do?
    >   It compares and finds differences between two aforementioned files.

11.  How many users exist in *Guitaca*?
    >   Online users can be obtained using the command: who. All users can be listed by displaying the contents of the cat/etc/passwd directory and counting them with the wc command (48).

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cat/etc/passwd | cut -d: -f1,7 | sort -k2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cat/etc/passwd | cut -d: -f7 | grep ``/sbin/nologin``| wc -l

14.  What is the name of the linux distribution running on *Guitaca*?
    >  3.17.8-200.fc20.x86_64

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github
    >  Taken from http://www.tomshardware.com/forum/236826-50-linux-shell-script-find-duplicate-images

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >  

17. How many unique images are in the ``sipi_images`` folder?
    >   215
