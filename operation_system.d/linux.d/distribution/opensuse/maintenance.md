# enable transactional updates

```
#@see: https://kubic.opensuse.org/blog/2018-04-04-transactionalupdates/ - 20180404

#do it on a daily basis
##run the command line call `transactional-update` once a day
systemctl enable --now transactional-update.timer

#remote when all is done
systemctl enable --now rebootmgr.service
#rebootmgr can be configured in /etc/rebootmgr.conf
```
