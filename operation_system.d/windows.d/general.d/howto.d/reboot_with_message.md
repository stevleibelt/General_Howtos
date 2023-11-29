# Issue

You have to reboot a machine and need to notify the user.

# Solution

* Login as Administrator
* `shutdown /r /f /t <int: seconds, 600 for 10 minutes> /c "The system will be rebooted in 10 minutes. Please save all your work. You can login after the reboot" /d p:0:0`
