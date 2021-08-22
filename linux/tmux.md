# TMUX and SCREEN

## TMUX
Hierachical Order: Session -> Windows -> Splits

Activation key in tmux session: <C-b>

start new:
```
tmux new -s <name>
<C-b>:new -s <name>
```
attach
```
tmux a -t <name>
```
dettach a session
```
<C-b>d
```
list sessions:
```
tmux ls
```
kill sessions
```
tmux kill-session -t <name>
```
show all session in tree (including windows):
```
<C-b>s
```
create new window:
```
<C-b>c
```
rename window:
```
<C-b>,
```
rename a session
```
tmux rename-session -t <old_name> <new_name>
<C-b>d
```
Splitting:

-   Vertical
```
<C-b>%
```
-   Horizontal:
```
<C-b>"
```
- Moving between splits:
```
<C-b><Up/Down/Left/Right>
```

