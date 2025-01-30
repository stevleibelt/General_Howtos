# Mail

## Basic commands

```bash
# send a mail
mail -s <string: subject> <string: email_address> <<DELIM
This is a test email content
DELIM

# list system internal email alias as mapping from user to possible email address
cat /etc/aliases

# apply changes made in /etc/alias
newalias

# list mail log
tail -f /var/log/mail.log

# list local mailboxes
ls -halt /var/spool/mail/
```
