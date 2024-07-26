# Ansible roles

Are the evolution of playbooks.

Organized via a simple directory naming convetion.

Roles can not use any inventory variables.

A role can be created via `ansible-galaxy role init roles/my_role_name` from your ansible root directory.

If you want to separate your yml files but all should be automatically loaded, create a `vars/main` directory and put in all your yml files.
