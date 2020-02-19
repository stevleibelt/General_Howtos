# Useful commands

## On the command line interface

```
#start new screen session
screen
#with window name
screen -S <my name>

#list available screen sessions
screen -ls [<match>]

#detache a running screen session
screen -d [<session identifier>]

#reattach to existing screen session or list available sessions
screen -r [<session identifier>]
#if your screen session is locked, or still marked as attached, detach it first
screen -d -r [<session identifier>]

#kill screen session without reattaching it
screen -S <session identifier> -X quit
```

```
#start a programm like irssi in a screen session
/usr/bin/screen -DmS "irssi" /usr/bin/irssi &
```

## In a screen session

Window and shell are more or less the same.

| Command | Description |
| --- | --- |
| CTRL+a +? | List session parameters |
| CTRL+a +c | Create new window |
| CTRL+a +w | List all opened windows |
| CTRL+a +A | Rename current window |
| CTRL+a +n | Go to next window |
| CTRL+a +p | Go to previous window |
| CTRL+a +CTRL+a | Back to last used window |
| CTRL+a +<int> | Got to window number x |
| CTRL+a +" | Choose the window to go to |
| CTRL+a +k | Kills current window |
| CTRL+a +S | Splits current windows horizontal |
| CTRL+a +TAB | Switch between splitted windows |
| CTRL+a +| | Splits current windows vertically |
| CTRL+a +d | Detache from session |
| CTRL+a +r | Reattach to detached session |
| CTRL+a +[ | Start copy mode |
| CTRL+a +] | Paste copied text |

# links

* http://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/
* http://www.dayid.org/comp/tm.html
