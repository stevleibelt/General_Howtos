# Box is shutted down but still listed at running

"VM in virtualbox is already locked for a session (or being unlocked)".

```
@see: https://stackoverflow.com/questions/35169724/vm-in-virtualbox-is-already-locked-for-a-session-or-being-unlocked/38532942#38532942
VBoxManage startvm <vm-uuid> --type emergencystop
```

# Windows Hyper-V is running on boot so virtual box can not start

"VMMR0_DO_NEM_INIT_VM failed: VERR_NEM_MISSING_KERNEL_API (VERR_NEM_MISSING_KERNEL_API).VT-x is not available (VERR_VMX_NO_VMX)."

```
#@see:
#	https://derekgusoff.wordpress.com/2012/09/05/run-hyper-v-and-virtualbox-on-the-same-machine/
#	https://forums.virtualbox.org/viewtopic.php?t=93200
#open cmd as admin
#	ALT+R
#	cmd
#	CTRL+SHIFT+ENTER
#turn off automatically start of Hyper-V on windows boot
bcdedit /set hypervisorlaunchtype off
```
