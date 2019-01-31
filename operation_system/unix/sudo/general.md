# Sudo

## What is sudo good for?

* leads the team to agree who is repsonsible for what (accountability)
* enforces job duties and responsibilites to put into a configuration file
* answers the questions
    * what are the boundaries of your responsibilities?
    * what permissions do you need to do your job?
    * which tasks should be done by someone else?

## Kickstart for day in day out work

* do not use sudo if you can solve an issue with group privileges
* the policy configuration file is located at "/etc/sudoers"
* use visudo (set your $EDITOR if you don't like vi) to edit the policy configuration file to prevent running into syntactically issus (no parsable file)
* the last fitting rule always wins, use this as a 

## Basic usage of the command

```
#run as a different user
sudo -u <user name> <command>

#run as a different primary user group
sudo -g <group name> <command>

#or if you want to go crazy and use ids
sudo -g #<group id> <command>

#preserve environment
#good if you have a lot of bash alias you want to keep
sudo -E <command>

#set the default shell
sudo -s <shell> <command>
```

## Basic usage of the policy configuration file

```
#first, have a look what you are allowed to do
sudo -l

#the most generic example
#<user name>    <hostname>=<command>
#allow any user on any host run any command
ALL ALL=ALL

#allow "bernd" on any host run any command
bernd ALL=ALL
```

# books

* Sudo Mastery - Michael W. Lucas - Tilted Windmill Press
