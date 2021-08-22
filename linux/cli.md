# CLI: some usefull commands and stuff related to Linux OS

## File system

You're always in a folder somewhere: that means you can navigate in and out any folder. Check `pwd` to see your current dir.

The `/` present your root dir.

## Help, Arguments/ Parameters, Flags (sometimes call Options/ Switches)

Want to check usage of any commands, add `--help` after that command.

Argument, parameters are something you pass to a command to make it work as you want. E.g. `cd ..` then `..` is an argument. Not all commands need arguments, sometimes arguments are optional. 

Flags: short form and long form. E.g. `--help` is a flag, sometimes you can also write `-h` as a short form of it. Like arguments, they're bits of information that change how command works.


## Signal and power of CTRL (sometimes denote as <CR> or <C>)

Signal is a notification that you send to a program.

**<C-c> - SIGINT**

That means you want to **int**erupt what's doing and stop. E.g run `yes` command and you have to <C-c> to stop :v 

**<C-d> - SIGQUIT**

Less usefull but still good to know 'cause it is Signal Quit. Many programs dont respond to <C-d> (some might) but bash itself definately will. Like when you connect to a server, <C-d> will tell the bash session to end.

**SIGTERM**

If you use `kill` command to kill another program, the way it does by sending SIGTERM to the program. 

**SIGKILL**

If you want a program to stop and stop **now**, do `kill -9` or `kill -SIGKILL`. That kinda means "dont clean up, just stop as soon as possible".

**More Signals**

There're many of them, run `kill -l` then it will show you all the signals your computer supports.

## Some commands

Some of the useful commands that everybody knows :v 

- echo.

```
echo $SHELL
```

- list files
```
ls ~
```

- print current dir
```
pwd
```

- special dirs: `~`, `..`, `.`,...

- cat: originally written to conatenate all files from its arguments:
```
cat beep.txt boop.txt
```
but can also be a handy way to display content of a text file.

- cp: copy a file or dir, or even multiple files
```
cp a.txt b.txt wow/
```
`cp -r` to recursively copy all files and subdir to new location or `cp -R` to list them out.
```
cp -r xyz/ newxyz/
```

- mv: move files or overwrite files 
```
$mv a.txt b.txt

$mv a.txt b/
```

- mkdir and mkdir -p: to make new dir and make new nested dir

- **brace expansion**: `{}` to expand pattern
instead of doing
```
$ mkdir -p foo/bar/barx foo/bar/barz
``` 
we can do
```
$ mkdir -p foo/bar/bar{x,z}
```
even you can do multiple expansion
```
~/doc $ echo robot/{c3po,r2d2}/{sound.mp3,info.txt}
robot/c3po/sound.mp3 robot/c3po/info.txt robot/r2d2/sound.mp3 robot/r2d2/info.txt
```
or even **expansion sequences**
```
~/doc $ echo wow{1..10}
wow1 wow2 wow3 wow4 wow5 wow6 wow7 wow8 wow9 wow10
```

- **wildcards**: `*` for anything (include nothing). `?` for **exactly** one character. Sometimes, you can use `[]` to limit characters too. E.g. `ls file[1-5].txt` or exclude by `ls file[^1-5].txt`.



- rm: remove files or dir
```
rm b.txt
rm b/ -r
```

- wc: word count with some flag like `-l` (line), `-w` (word), `-c` (character)
```
wc notes.txt
```

- man: mannual for any commands
```
man wc
```

- more on flags:
sometimes position of them doesnt matter
```
$ grep -i wow
$ grep wow -i
``` 

sometimes options have value
```
$ head -n 1
$ head -n1
```

- write to a file: `>`
```
~ $ echo ahoy thar > greetings.txt
```

- append to a file: `>>`
```
~ $ echo wow > cool.txt
~ $ ls >> cool.txt
~ $ cat cool.txt
wow
cool.txt
doc
media
notes.txt
projects
```
- read from a file: `<`
```
~ $ wc -c < notes.txt
35
```
- head: print first part of a file.
like read first 3 lines
```
$ head -n3 mobydick.txt
The Project Gutenberg EBook of Moby Dick; or The Whale, by Herman Melville

This eBook is for the use of anyone anywhere at no cost and with
```
or first 20 bytes:
```
~ $ head -c20 mobydick.txt
The Project Guten
```

- tail: the opposite of `head`
```
~ $ tail -n4 mobydick.txt
This Web site includes information about Project Gutenberg-tm,
including how to make donations to the Project Gutenberg Literary
Archive Foundation, how to help produce our new eBooks, and how to
subscribe to our email newsletter to hear about new eBooks.
```

- cal: calendar
```
~ $ cal
   December 2014
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

~ $ cal -3
   November 2014         December 2014          January 2015
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1      1  2  3  4  5  6               1  2  3
 2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
 9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30 31
30
```

- **date**: print out date
```
~ $ date +'%Y-%m-%d %H:%M:%S'
2014-12-27 20:45:07
```

- fold: break some text into shorter lines
like breaking some text at 30 characters
```
~ $ head -n250 mobydick.txt | tail -n3 | fold -w 30
can see a whale, for the first
 discoverer has a ducat for hi
s pains....
I was told of a whale taken ne
ar Shetland, that had above a
barrel of
herrings in his belly.... One
of our harpooneers told me tha
t he caught
```
or break on spaces with `-s`
```
~ $ head -n250 mobydick.txt | tail -n3 | fold -sw 30
can see a whale, for the
first discoverer has a ducat
for his pains....
I was told of a whale taken
near Shetland, that had above
a barrel of
herrings in his belly.... One
of our harpooneers told me
that he caught
```

- curl: handy little tool for making HTTP requests:

```
~ $ curl -s https://github.com/substack.keys | tail -n1 | fold -w75
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQC7wF3cwpH+NVG+qNz0PLjEg9IqaNyXeeITme9
fksfJx/rTyoFAWW+JrJVKLPNBCe63JYvp3pTvPqJRg/8hEb/+uFlIIzUNhHAUSaS1mmKgnTHbb+
1d8CkFAZiZnDhFOKRkEXh5R9F9htNQVIjyzD3XL/H69mb8YzICItq/9klVTZ66s1thp7r3V5+qE
hbLB4yH6stXyuj2SZiMS+CJeVBJ8Pf/CCUH66NK2o7l1zliJwme+UJry1RtxWQBfEChj9qe36B/
bR3HACtx6ANMdYJsOxZm0znUjn/XJ9jxy22nVJY5otwZNeIZSSyA1lZB2mZRzTTWzPPx62VWdgH
eQdOmnqBP0YWpxPBSMJwn4kFt6aGImrm7WTU5sHwqqxRgNvcrecxPWgbdLcV+x/OWF5bug3s096
AWcP4wQI101w7QtI3cc5+JKHSGssuY17jyyNaHttE7GafBu3pbK93YolgNAMyYUHVicgK+uY6o+
sH4gcRx+RyQ4OkO7Js49wJi0AXPGhp5QRmIFpua/vVzhMTwMhqW+6luWgfPeAVqn95erc49cY+W
2B83ZgaDVSuRfDafVCSjUl+oXG/1KxzP2F/ZhGmNGmBRnF5N4OLHW6/KtVgxCpf3+1bcgye+yiq
NQuM5/NNWZRw3NJhk0XEppd5Ai4JpvguDLhWZ19/+XEvFj9kwKRMRbxf1M7hWDutAE46sQc9x4M
135M/SyuHW9asHBDCJPgD3nBAjYpMV0fQxIbcNiYWF+JsH6NzhRpLnsTNUvsfUcC/FQqX3VD0Xu
IEoYmKwDesv6PU60pQNEi6p4u+PnFHS/vvRASYLo/4s+99GQDWxqzi0jjYVWheQW9RLnTU+ghud
A+xPp7CK/tH8/RAutDdk3k0HdsNTsjHFN/HvM23UIHOpuY07yohayQididHt023IAZdys6m2daQ
RUKXM8cfaFdQqoj/vaby7pxBPWzO6tuXy1tI6gQ+nolZaXQfXUBHF1uBXo1UQI0dp8J5tCppty6
NvXmvv90PBGVXOlplyhXB9q0JXBInidATeT8zlgM4Iq1X6ZVlXN2OIU5CiWVA1NYmf05709e6SK
P0kK2oh19gA+qg1oPOw0WTpZGKz/9NCCw2ywK2/yNJRWuIbSE4RAv6N8v7qtPObwAU5Lohj8oQV
yC/bbLF6VuVJo6V/nfvP+EJKtsXlBBPBzdsmV1hikkGLJx7Up1s7WTZCwSeSGFPXCe7RdElz2mQ
YB6dwEbhaGl48MhuiIeER7KZqzQFOu74G0u5tyyCUeEc90BkeUcf/EhrxfS8R9ZRJ9ce7IpYQ4+
9wTBKFzVc1HinCSUwJTu7m+UHLaaNbK+WCIF+2fFvM1IJmTh2pWSMb
```

- backtick: 
Sometimes it's usefule to include the output of a program in the arguments list of another.
```
$ echo Greetings from the year `date +'%F %T'`
```

- **arithmetic**
With `$((...))` expressions, you can do simple arithmetic on the command line!
```
$ echo $((4*5+1))
21
```

- **quotes**
If you want to use char like `<` or `>` in arguments to a program, you need to use quote:

```
~ $ echo '<b>wow</b>'
<b>wow</b>
```
Double quotes are similar but env variables and blackticks will be interpolated in-place (replaced with their value):
```
~ $ echo "There's no place like $HOME."
There's no place like /home/substack.
~ $ echo "So long `date +%Y`..."
So long 2021...
~ $ echo "So long `date +%Y`... next stop $((`date +%Y`+1))"'!'
So long 2021... next stop 2022!
```

- tar: tar is short for tape archive and it intially used to prepare files to be backed up to a magnetic tape archive but it became useful to just group together files in single files as a tarball (like zip file).

lets say we wanna put three files and a folder into a single tarball. Run:

```
mkdir folder1
touch file1.txt file2.txt folder1/file3.txt
tar -cf archive.tar file1.txt file2.txt folder1/
ls -lsah
```

However `arhive.tar` is not compressed yet, to compress it you need to tack on the `-z` flag, so:
```
tar -zcf archive.tar.gz file1.txt file2.txt folder1/
ls -lsah
```

to unpack:
```
mkdir destination-folder/
tar -xzf archive.tar.gz -C destination-folder/
```

### The Standard Streams

- **stdout**
```
echo "this will get output to the file and not to stdout" 1> new-file.txt
```

The `1>` redirec stdout from heading to terminal into a file. It can also apply to append as `1>>`:

```
ls -lsah 1>> ls.txt
```

- **stderr**
```
ls -lsah 2> error-log.txt
```
It will show nothing in error-log.txt 'cause there's no error, and the terminal will show results of listing files like normal.

But this case, it will show in error-log.txt:
```
cat file-that-doesnt-exist.txt 2> error-log.txt
```

Usually, if you dont write with the number, it will append/ write with *both* streams.

- **/dev/null**
In case you dont give a shit about what the output is, just wanna run the program, then go for `/dev/null`:
```
ls -lsah 1> /dev/null  # assume this is a very noisy program
```

- **stdin**

With stdin, we can redirect the content of a file into the program via `<` as I already mention above. Let's make a example of combining both stdin, stdout, stderr:
```
grep "error-log.txt" < ls.txt 1> ls2.txt 2> /dev/null
```


### Pipe

Besides `>`,`<`,`>>` as redirect operators, the last but most important kind is pipe `|`.

With `|` you can feed the output of 1 program to the input of the next.

```
~ $ ls -1 | wc -l
5
```
You can chain together commands with `|` as much as you like.

```
~ $ curl -s http://www.gutenberg.org/cache/epub/2701/pg2701.txt
| sed -r 's/\s+/\n/g' | grep -i whale | wc -l
1691
```

Now break that line down:
    -   curl: fetch text file and print the results to stdout
    ```
    curl -s http://www.gutenberg.org/cache/epub/2701/pg2701.txt
    ```
    -   sed: convert all whitespaces (tabs, spaces, newlines) into newlines. This means each word gets its own line:
```
~ $ echo one two three beep boop | sed -r 's/\s+/\n/g'
one
two
three
beep
boop
```
- grep: filter output so that only lines contain the word 'whale' will be shown.
```
grep -i whale
```
- then `wc` to count lines
```
wc -l
```

### Environments

Environment variables are defined by the shell and shell scripts.

To list them out, use `export` (maybe `printenv`):

**Env variables**:
Env variables are defined by the shell and shell scripts.

You can use any environment variables or create ones
```
echo $HOME
HUAN='dep trai'; echo $HUAN
```

This way of declaring env variables only affects in this session only. If you wanna keep it permanent, use `.bashrc` or `.bash_profile`. `.bash_profile` is only run on login shell, which means it's only run once for each time you log in to your computer, *not* after that. `.bashrc` is run on every nonlogin shell, so it's run on every tab of bash you start up.

**$PATH**: special env variable, is a list of places separated by `:` that bash will look when you type a command. If you put your own commands in one of the dir in `PATH`, you can make your own command without needing specify a relative or absolute path! 

Also, `/usr/local/bin` is the customary place to put system-specific scripts that are not managed by your system distro.

### Processes

Linux is built to handle multiple programs running parallel. Use `ps` to see "process snapshot", use `ps aux` to show everything running from everyone, including all system processes. Use `pgrep` to search for a process by its name.

**Background and Foreground**:

A proc can either run in the foreground or background. If something run in the foreground, you'll see all output and wait until it's finished. If it's running in the background, you can still see the output but you can also start doing other things.

Using <C-c> to terminate proc in the foreground, <C-z> to put a proc to the background. `fg` a proc to move it from the background to the foreground by *its JOB* (job id), and `bg` to push it to background from the foreground. The difference between job and proc is [here](https://unix.stackexchange.com/questions/4214/what-is-the-difference-between-a-job-and-a-process): a proc is any running program with its own address space, job is concept by the shell - any program you interact not a deamon is a job. Also, we can use `&` to background a proc.

**Job syntax**: 

when the shell show jobs as `[N]` (as command `jobs` or when use <C-z>), `N` is the job id. Use `%N` to refer to a particular job or `%%` for the most recent job. Use `kill -9` or `kill -s SIGKILL` to kill a job, like
```
~ $ perl &
[1] 29870
~ $ pgrep perl
29870
~ $ kill %1
[1]+  Terminated              perl
```

## Permissions

**User**: user is like account of the system, `whoami` to see current user, `cat /etc/passwd` to see currently registerd users.

**Superuser-Sudo**: The `root` user is superuser having ultimate power, `sudo su` to "switch user", but sometimes you just need to do specific command with `root` privillege at a time, so use `sudo` before that command. Some user has superuser privillege to masquerade (called **sudoer**), some don't. For example:
```
sudo useradd brian
sudo passwd brian
# making the password
su brian 
# typing the password
whoami
sudo su  # error: brian is not in the sudoers file.  This incident will be reported.


**Group**: collection of users. Some groups have special privillege, like `sudo` group. 

To add user to sudo group: 
```
sudo usermod --append --group sudo brian # or -aG
```

To see what group you belong to: `groups`


**Permission**: Each file on a UNIX or Linux system belongs to a user and a group.Everytime you use `ls -l`, you can see something like `-rw-r--r--`: This string decribe permission of a file.

The first character is for some fancy use. It indicates a file `-` or a directory `d` or other things (`b` for blockfile,..)

The next 6 characters (3 group of 3 characters):
```
rwxrwxrwx
```

(r)ead, (w)rite, e(x)ecute, `-` meaning that permission is not available.
    -   the first `rwx` says what the owner can do.
    -   the second `rwx` says what users in the group can do.
    -   the third says what everyone else can do.

**chmod**, **chown**: `chmod` is for changing the access permission of a file, `chown` is changing the owner of a file.

Lets create a directory in root.

```
whoami # should say huan
cd /
mkdir hello # permission denied, you don't have permission to do that here
sudo mkdir hello # works, but now hello is owned by root:root
ls -l # notice hello is owned by root:root
touch hello/text.txt # permission denied, you don't own hello
sudo chown huan:huan hello # it's <group>:<user>
ls -l # notice hello is now owned by huan:huan
touch hello/text.txt # works!
##### chmod
whoami # should be huan still
cd ~ # go to home directory
sudo touch secret.txt # make a file as root
ls -l secret.txt # -rw-r--r-- so root can read and write but no one else can
echo "very secret message" >> secret.txt # doesn't work, permission denied
sudo chmod u=rw,g=rw,o=rw secret.txt # make it so anyone can read or write to the file
echo "very secret message" >> secret.txt # works this time!
cat secret.txt # should see very secret message
```

The formula is `u=rwx,...` with `u` for user, `g` for group, `o` for others (everyone else). Or just go for `chmod 777` (shortcut for `chmod u=rwx,g=wrx,p=rwx`).

For number form, `0` for zero permission, add `4` for read, add `2` for write, add `1` for execute permission.

Another form of using `chmod` is with `+` or `-`. E.g. if you want to make a file execuatable, use `chmod +x <file>`, and `chmod -x <file>` for take it away.



