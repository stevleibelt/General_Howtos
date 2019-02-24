# listing stuff

```
#list available units (services, timers etc.)
systemctl list-units

#list failed stuff
systemctl --failed
```

# managing a service

```
#restart
systemctl restart <name>.service

#start
systemctl start <name>.service

#stop
systemctl stop <name>.service

#start it on boot
systemctl enable <name>.service

#stop it on boot
systemctl disable <name>.service
```

# link

* [systemd Basics - LearnLinux.tv](https://www.youtube.com/watch?v=AtEqbYTLHfs) - 2015-04-23
