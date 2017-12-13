# Box is shutted down but still listed at running

"VM in virtualbox is already locked for a session (or being unlocked)".

```
@see: https://stackoverflow.com/questions/35169724/vm-in-virtualbox-is-already-locked-for-a-session-or-being-unlocked/38532942#38532942
VBoxManage startvm <vm-uuid> --type emergencystop
```
