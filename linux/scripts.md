# SHELL SCRIPTS

Bash is actually a programming languages, we have just been running it one line at a time via REPL (Read Evaluate Print Loop) - like when we run `python` or `node`. Now lets learn some basic things about the language and write our own scripts.


## Make the first script, hashbang/ shebang

First lets write some basic commands in a file called `gen_files.sh`

```
mkdir -p ~/temp # -p mean don't error if it exists in this case, it does other things too
cd ~/temp
touch file{1..10}.txt
echo done
```

That's bash script! Just it, basically a punch of commands in a `.sh` file. You can run it by `. gen_files.sh` or `source gen_files.sh` or more common `bash gen_file.sh`. But what if we could  make it indistinguishable from a normal command like cp or curl? Here **shebang** come!

Open the file and add this **at the very first line**:
```
# !/bin/bash
```

Some more step, make it executable by :
```
$ chmod 700 gen_files.sh
```

Now if you wanna run it, do `./gen_files.sh` because the file is still not in the `PATH` yet, so we have to write absolute path. 

Well, put it in the `PATH` then (specifically, in `/usr/local/bin` for our own command), also make it look more like a command by rename the file to `gen_files`:
```
$ mv gen_files.sh /usr/local/bin/gen_files
$ gen_files
```


## Comment

By `#` :v 

## Exit code/ Exit status

Value to pass to parent process while the program terminates: `0` for success and higher for failure. To see the exit code of the last command, use `echo $?`.

Tables for looking up [here](https://www.cyberciti.biz/faq/linux-bash-exit-status-set-exit-statusin-bash/).

## Variables 

**Declaring**: by `NAME=value` like this:
```
#! /bin/bash

DESTINATION=~/temp
FILE_PREFIX=file

mkdir -p $DESTINATION
cd $DESTINATION
touch ${FILE_PREFIX}{1..10}.txt
echo done
```
The line with `FILE_PREFIX`, the variable wrapped by `{}` because it was inserted in the middle of something, to let bash know where the variable stop. Other cases, just use variables like normal, as the line above that.

Using subcommand/ sub-shell by `$()`, e.g `touch $(whoami).txt`

**Read input**:

By `read`:

```
# !/bin/bash
DESTINATION=~/temp/
read -p "Enter a file prefix: " FILE_PREFIX 

mkdir -p $DESTINATION
cd $DESTINATION
touch ${FILE_PREFIX}{1..10}.txt
echo done
```
The flag `-p` in the `read` line is used for **p**rompting the user with a string.

## Conditionals
```
#!/bin/bash
DESTINATION=$1
read -p "Enter a file prefix: " FILE_PREFIX

if [ -z $DESTINATION ]; then
        echo "No path provided. defaulting to ~/temp"
        DESTINATION=~/temp/
fi

mkdir -p DESTINATION
cd $DESTINATION
touch ${FILE_PREFIX}{1..10}.txt
echo "done"
```
`[]` actually translate to command `test`, so the conditionals line is `test -z $DESTINATION`. The `-z` flag check whether the variable is an zero length string.

There's a bunch of operators with test:
-   `-eq`: equal. e.g. `test 5 -eq 5`
-   `-lt`/`-gt`: less than/ greater than
-   `-w`: whether file exists and you can write to it. e.g. `test -w hi.txt`
-   `-f`: whether file exists and it's a regular file.
-   `-e`: whether file exists.
-   `!`: negation mark or "not" operators.

### else and elif
```
if [ $1 -gt 10 ]; then
    echo "greater than 10"
elif [ $1 -lt 10 ]; then
    echo "less than 10"
else
    echo "equal to 10"
fi
```

### case statement:

```
case $1 in
  "smile")
    echo ":)"
    ;;
  "sad")
    echo ":("
    ;;
  "laugh")
    echo ":D"
    ;;
  "sword")
    echo "o()xxx[{::::::::::::::>"
    ;;
  "surprise")
    echo "O_O"
    ;;
  *)
    echo "I don't know that one yet!"
    ;;
esac
```

## Arrays and For Loops

```
friends=(Anh Bang Chau Duc "Van Em" "Thi Gai")

echo "My second friend is ${friends[1]}"

for friend in "${friends[@]}"
do
    echo "friend: $friend"
done

echo "I have ${#friends[*]} friends"
```
One thing to note: If you dont put quote on `"${friends[@]}"`, the echo part may print `"Van Em"` and `"Thi Gai"` as 4 lines instead of 2. 

### While

```
let "NUM_TO_GUESS = ${RANDOM} % 10 + 1"
# NUM_TO_GUESS=$(( $RANDOM % 10 + 1 ))
GUESSED_NUM=0

echo "guess a number between 1 and 10"

while [ $NUM_TO_GUESS -ne $GUESSED_NUM ]
do
    read -p "Enter your guess number:" GUESSED_NUM
done

echo "You got it!"

```

Let's talk about `let`. `let` allows you to do math. You feed it a string of math of some variety and it will evaluate it for you. The shortcut to doing (similar to how `test` works with []) is the dollar sign with double parentheses. 

The `$RANDOM` is just a random number which we're using [module][mod] to get random number between 1 and 10.

Here the line with `read` the `GUESSED_NUM` has no `$` before it, Why? Because we dont want to substitute value (which is `0`) into that, we want the `read` to read the value we input.

Then the interesting part there is our while loop a lot like an if statement. And that's it!

Then the interesting part there is our while loop looks a lot like if statement.

## CRON

Linux has a feature called "cron" for running tasks on a schedule. Maybe its name comes from "chronological".

Two ways of accomplising this:
-   putting scripts in cron folders
-   using crontab to define tasks

### Cron folders

For Ubuntu, cron folders are:
-   /etc/cron.daily/
-   /etc/cron.hourly/
-   /etc/cron.monthly/
-   /etc/cron.weekely/

Just make sure you have executable priviledges `sudo chmod +x <script>`

### Crontab

If you need more defined schedule (like every 5 min, every 4 A.M because server is kinda free at that time :v, every Thursday,..), use crontab.

Lets say we wanna make new file in every 2 mins. The `date +%s` part means seconds in number from 1970-01-01.
```
mkdir -p ~/temp-files
cd ~/temp-files
touch file-$(date +%s).txt
```

Now do `crontab -e`, it will ask you what editor you prefer to edit your crontab. Then, it will go to the file and then you can write the crontab syntax:
```
*   *   *   *   *   <the command you want to run>
```
Each star represents as follow:
```
<minutes>   <hours>     <day of the month>  <month> <day of the week>
```
the stars mean "every", hence 5 stars means "every minutes", so if you wanna command once an hour on the fifth minute, we should do:
```
5   *   *   *   *   <the command you want to run>
```
You should check out the [crontab.guru](https://crontab.guru/) for the translation between English and crontab syntax.

Also, you can run `crontab -u   <user .e.g root, huan,..> -e` to specify the user for the cron job.

