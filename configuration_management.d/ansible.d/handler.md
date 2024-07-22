# Ansible handlers

Handlers are tasks than are executed via a notification.

Essential, a syntactic replacement could be `register->when: changed`.

Handlers **always** run on the end **except** they are called via `- meta: flush_handlers`.

