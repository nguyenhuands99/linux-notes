# VIM 

is a popular comamand-line text editor (you can call it like a language or even a religion :v)


## Vim cheat sheets

Check them out 

http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/

http://www.fprintf.net/vimCheatSheet.html

## Why vim?

-   edit file on a remote server over ssh
-   works without a graphical desktop environment
-   many programming-specific fueatures
-   really fast editing

## Save and Quit

The first thing to know is how to quit vim :v
-   `:q` to quit, `:q!` to quit without saving
-   `:wq` to save and quit, `:w` for just save, `:w <name>` for saving a new name

## Vim Mode

Some modes:
-   Normal/ Command by `esc`
-   Insert  by `i`
-   Visual by `v` in command mode
-   Visual line by `V` in command mode

## Moving around

In command mode `esc`, hjkl to move around
-   h - move left 1 character
-   j - move down 1 line
-   k - move up 1 line
-   l - move right 1 character

**hjkl elsewhere**: Yes, they happens in `less` and some other programs also (like Twitter :v)


**Even more way to move around**:

-   ^ or 0 - move to the start of the current line
-   $ - move to the end of the current line
-   gg - jump to the beginning of the file
-   G - jump to the end of the file
-   w/b - jumpt to words forward/backward

## Delete

There are so many ways to delete!

-   x - delete character
-   dd - delete the current line
-   d$ or D - delete from the cursor to the end of the line
-   d0 or d^ - delete from the cursor to the beginning of the line

You may see something similar, that's true you can repurpose each of the moving command to delete text, E.g:
-   dG - delete to the end of the file
-   dgg - delete from the current line to the start of the file
-   dj - delete the current line and the line below
-   dk - delete the current line and the line above
-   2dd, 3dd,... - delete the next N lines.

## Searching

You can search for text using regular expressions.
-   /PATTERN - search forward for PATTERN
-   ?PATTERN - search backward for PATTERN

Press:
-   `N` for previous match
-   `n` for next match

You can also combine searching with deleting:
-   d/PATTERN - delete **TO** the **next** match of PATTERN
-   d?PATTERN - delete **TO** the **previous** match of PATTERN
-   dn - delete to the **next** of **already matched** PATTERN
-   dN - delete to the **previous** of **already matched** pattern

## Jumping

You can also skip ahead to individual character in a simple way on the current line
-   f + CHAR - search forward on the current line **TO** CHAR
-   F + CHAR - search backward on the current line **TO** CHAR
-   t + CHAR -  search forward on the current line **BEFORE** CHAR
-   T + CHAR -  search backward on the current line **BEFORE (bacwards)** CHAR

These are very useful in combination with the delete operators! They combine as you might expect:

-   df + CHAR - delete forward on the current line **TO** matched CHAR
-   dt + CHAR - delete forward on the current line to the character **BEFORE** matched CHAR
-   dF + CHAR - delete backward on the current line **TO** matched CHAR
-   dT + CHAR - delete backward on the current line to the character **BEFORE** matched CHAR

## Search and replace

```
:s/PATTERN/REPLACEMENT/FLAGS
```
FLAGS is optional:
-   no FLAGS for the first occurence in current line
-   g for all occurences in the current line (gc: for global and prompt to replace or not)
-   i for in-casesensitive

**Replace everything**:
```
:%s/PATTERN/REPLACEMENT/g
```

## Visual selection

Press `v` for visual select mode. Move cursor around to select text.

Once selecting the block:
-   `y` - yank the text into paste buffer
-   `d` or `x` - delete them
-   `>>` indent the text right by shiftwidth
-   `<<` indent the text left by shiftwidth

## Paste

Press `p` 

## More insert modes

There are more ways than just `i` for inserting:
-   o - insert mode at a new line below
-   O - insert mode at a new line above
-   a - insert mode at 1 character to the RIGHT
-   A - insert mode at the end of the line
-   I - insert mode at the beginning of the line

## Fancy odds and ends
-   J - move the next line to the end of the current line
-   `<backtick>` + `.` - jump to the last edit

## Insert more than text you typed

-   You can insert a file into the current position
```
:r <file>
```

-   Insert the output of a command into the current position
```
:r!pwd
```

