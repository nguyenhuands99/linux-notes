# NETWORKING

## SSH

SSH stands for secure shell, a network protocal that give users a secure way to access a server. 

To connect from a computer (let's call it primary) to another computer (secondary). First we need to create ssh key**s** for primary. The  basic gist is this: when creating ssh keys, you get 2 files, a public key and a private one. Public is what you give to anyone. Think of it like a lock (also public and everyone can see it). The private key is what you keep for yourself. *Never reveal it* to anyone, if you accidentally did, you should immediately stop using it and make a new pairs.

Check more info with [Diffeie-Hellman key exchange](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange) to more about the history of key encryption.

### SSH keys

One the primary, generate the keys:
```
ssh-keygen -t rsa
# hit enter to put the key files in the default place
# hit enter to give an empty passphrase (or create it, but you have to type it everytime)
# hit enter again to confirm
```

Here we're generating a new random key. This key is essentially unguessable and therefore unless something unreal happens, is unhackable from a brute force perspective. We're telling it to put everything in the `~/.ssh ` directory which is standard.

### Connecting to secondary

Go to your secondary machine and create a file in `~/.ssh` and paste the content of `id_rsa.pub` from primary machine to the file (in this case, `authorized_key`). Also, make the folder executable and give the file write/read permissions.

```
mkdir ~/.ssh
vi ~/.ssh/authorized_keys # paste in copied ssh id_rsa.pub from primary, write, and quit
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```
Note: you typically won't have to do this yourself. With someone like Azure or DigitalOcean, you'll give them your idrsa.pub and they'll take care of making sure it gets into authorizedkeys. You'll just have to generate it and give it to them.

Lastly, you need to know the ip of your secondary to access to. Use `ifconfig` to see. Now go ahead:
```
ssh <user>@<the ip of your secondary>
```

## SFTP vs scp vs rsync

Sometimes you need to transfer files between computers, either local to server or server to server. Before we had more mature continuous development tools like Azure Pipeline, Travis CI, Github Actions,.. we oftenused a tool called FTP (File Transfer Protocol). While it worked and it was relatively simple and straighforward of doing things, we moved onto to more reliable tools:
-   sftp
-   scp
-   rsync

### sftp

**Setting up**

One of the best things about SFTP is that it works 100% over the same ways as SSH does so if you've set up ssh you've inherently set up sftp too.

The SFTP interactive shell is similar to a less friendly and stripped down version of Bash. *You're in 2 directories at the same time**: local context (your primary) and remote context (your secondary). To run command on local, use `l` before the command (just some commands, others will use `!` before them) .e.g. `lls`, `lpwd`, `lcd`,.. And just use normal command when you want to run it one the remote.
```
sftp <user>@<ip to your secondary>
lpwd
pwd
lls
ls
help
```

Two key commands for transfering are: `put` and `get`. It's from the local perspective so `put` means uploading to secondary computer, `get` means downloading.

For example:
```
!touch file-to-put.txt
put file-to-put.txt putted-file.txt # second argument is optional, if you omit it'll just use the same name
get putted-file.txt gotten-file.txt # same thing, second one is optional
```

### scp vs rsync

These tools also works over SSH.

**rsync** is a file synchronization and file transfer program that minimize network data transfer by using [delta transfer algorithm](https://rsync.samba.org/tech_report/) that only the differences b/w source and destination data are actually transmitted.

Syntax:
```
rsync <mydata> <user>@<remote-host>:<target-directory>
```

**scp** is the secure analogue of the `rcp` command. It perfroms a plain linear copy over ssh 

Syntax:
```
scp <mydata> <user>@<remote-host>:<target-directory>
```

## WGET vs CURL

Frequently you wanna send requests to the Internet and/or network. Two common tools are `wget` and `curl`. I suggest sticking to `curl` because it can do almost everything `wget` can.

### wget

**wget** works like cp but instead of copying a local file you're copying something off the Internet. So you'll identify a remote file (usually URL) that you want to fetch and save to your local file system.

```
wget https://raw.githubusercontent.com/btholt/bash2048/master/bash2048.sh
chmod 700 bash2048.sh
. bash2048.sh
```
 The beautiful thing of wget that curl maynot have is the ability of recursively download other url, you can actualy download the entire website using wget.

### curl 

**curl** works like a normal Linux program, it works more like cat where cat where it operates on input and output streams. Curl can be used to do testing against API servers (as opposed to something like Postman or Insomniac). It can also do something with making HTTP requests.

**Output**: Since curl is stream-based, you can redirect output to a file `curl -o <file>` or just `-O` to a file named the same name. Note that the output file in compressed format (binary), use flag `--compressed` to get text output. E.g
```
curl https://www.gutenberg.org/cache/epub/2701/pg2701.txt -o whale.txt --compressed
```

**HTTP verbs**: Sometimes you wanna check an enpoint is working or not `curl -I` (or `curl --head`). This will send a HEAD request instead of GET. Other HTTP verbs can do by the format:
```
curl -X <PUT/DELETE/PATCH/OPTIONS/POST> <url>
```

**Cookies** by `--cookie` or `-b`:
```
curl -b "name=huan" <url>

**Redirects** by `-L`:
```
curl -L http://bit.ly/linux-cli
```

**Headers** with flag `-H` .e.g.
```
curl -H "'accept-language: en-US" -H "Authorization: Bearer 12345" <url>
```






