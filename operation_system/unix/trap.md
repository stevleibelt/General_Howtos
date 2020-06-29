# usage

```
#list available signals
trap --list

#disable handling of CTRL+C (to finish something importat)
trap "" SIGINT
execute_important_command

#enable handling for CTRL+C
trap - SIGIN
execute_not_important_command

#handle CTRL+C
trap "received CTRL+C" SIGINT

#handle CTRL+Z
trap "received CTRL+Z" SIGTSTP
```

# available signals

Additonally to the following list, trap can handle the following three signals.

| Signal | Description |
| --- | --- |
| EXIT | Is triggered when a process exits |
| ERR | Is triggered when a process exits with non zero status code |
| DEBUG | Boolean paramenter representing debug is enabled or not |

Following a list of official signals.

| Signal | x86/ARM integer |
| --- | --- |
| SIGHUP | 1 |
| SIGINT | 2 |
| SIGQUIT | 3 |
| SIGILL | 4 |
| SIGTRAP | 5 |
| SIGABRT | 6 |
| SIGIOT | 6 |
| SIGBUS | 7 |
| SIGEMT | - |
| SIGFPE | 8 |
| SIGKILL | 9 |
| SIGUSR1 | 10 |
| SIGSEGV | 11 |
| SIGUSR2 | 12 |
| SIGPIPE | 13 |
| SIGALRM | 14 |
| SIGTERM | 15 |
| SIGSTKFLT | 16 |
| SIGCHLD | 17 |
| SIGCLD | - |
| SIGCONT | 18 |
| SIGSTOP | 19 |
| SIGTSTP | 20 |
| SIGTTIN | 21 |
| SIGTTOU | 22 |
| SIGURG | 23 |
| SIGXCPU | 24 |
| SIGXFSZ | 25 |
| SIGVTALRM | 26 |
| SIGPROF | 27 |
| SIGWINCH | 28 |
| SIGIO | 29 |
| SIGPOLL | 29 |
| SIGPWR | 30 |
| SIGINFO | - |
| SIGLOST | - |
| SIGSYS | 31 |
| SIGUNUSED | 31 |

# links

* [Using Bash traps in your scripts](https://opensource.com/article/20/6/bash-trap) - 20200629
* [The Bash Trap Command](https://www.linuxjournal.com/content/bash-trap-command) - 20190807
* [signal - man7.org](https://man7.org/linux/man-pages/man7/signal.7.html)
