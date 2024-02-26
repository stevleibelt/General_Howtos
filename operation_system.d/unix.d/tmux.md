# tmux

## General

* Is a terminal multiplexer (opens multiple terminal sessions in one window)
* You can share a session
* Default prefix key is `Ctrl+b`

## Tmux vs screen

* Tmux is way younger
* Needs less ressources
* Scriptable
* Configurable
* Has layouts
* You can syncron run the same command on many screens at the same time

## Configuration

```bash
# example
# move status line to top
set -g status on
set-option -g status-position top

# you can also set colors

# remap repfix to control + y
set -g prefix C-y
unbind C-y
bind C-y send-prefix

# force a reload of the config file
unbind r
bind r source-f ~/.tmux.conf

# don't rename windows automatically
# set-option -g allow-rename off

# set this to 5 seconds for demo
set -g display-panes time 5000

# make panels more visible for demos
set-option -g pane-active-border-style "bg=black"
set-option -ag pane-active-border-style "fg=black"
```

### Commands

```bash
# start new session
tmux new -s <session name>

#stop session
exit

# detach
CTRL+b d
# or
:detach

# list session
tmux list-sessions
# or
tmux ls

# attach to session 0
tmux attach -t 0

# change to other session
:switch ?

# open a new window
:tmux new-window -t <name> -n <name> -d <programm like htop>

# swap panel
:swap-pane -s <source id> -t <target id>
```

## Link

* [video - tmux warum ein schwarzes fenster reicht](https://media.ccc.de/v/DCJGKA)
* [tmux crash course](https://robots.thoughtbot.com/a-tmux-crash-course)
* [tmux on archlinux](https://wiki.archlinux.org/index.php/Tmux)
* [source code](https://github.com/tmux/tmux/wiki)
* [tmux on wikipedia](https://en.wikipedia.org/wiki/Tmux)
