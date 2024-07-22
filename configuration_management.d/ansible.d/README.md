# Ansible

Use `ansible-doc` to get help.

```bash
# list all modules
ansible-doc --list

# list modules by type
ansible-doc --list --type become

# read manual about user
ansible-doc ansible.builtin.user
```

Ansible:

* Is written in python. All ansible modules are located in `/usr/lib/python3/dist-packages/ansible/inventory`.
* Does not have anykind of memory (there is no undo)
* Works on 12 hosts at once.
* Can do blue/green deployment (one, ten, rest)
  * See [execution strategies: ansible.com](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_strategies.html#selecting-a-strategy)
  * `ansible.cfg` `;forks=` defines the amount of parallel processed hosts
  * `ansible.cfg` `;serial=` defines how many machines have to finish all tasks (whole playbook)
  * `ansible.cfg` `;throttle=` defines the amount of workers per task
* Uses ssh as default user context
* Outputs parsing errormessages you simple can skip since no YAML-Linter knows the ansible language
* Ansible searchs in the following order for a ansible configuration file
  * `ANSIBLE_CONFIG` - Great to separete user runs from ci-runs
  * `ansible.cfg` - In the current working directory
  * `~/.ansible.cfg` - In the home directory
  * `/etc/ansible/ansible.cfg`
* You need to put "{{  }}" to create valid JSON
  * Valid JSON? Yes, since YAML is a subset of JSON
* Ansible commands are not passed to a shell

## Terms

* [playbook](#playbook)
* [task](task.md)
* [handler](handler.md)
* [inventory](inventory.md) -  matching list of servers to groups
* [roles](roles.md) - Package of tasks, variable,s handlers, modules and other plugins
* [groups](groups.md) - Contains group specific variables
* Places for variables:
  * In the inventory file
  * In `host_vars/<string: my.host.name>/vars.yaml` -> loaded in the global namespace `hostvars` (readable from all hosts)
  * In `group_vars/<string: my_group>/vars.yaml` -> loaded in the global namespace `hostvars` (readable from all hosts)
  * Since `hostvars` are readable by all machines, you can use them as IPC
  * Playbook scoped variables
  * Task variables
  * Extra variables
  * [order of variable evaluation: ansible.com](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#understanding-variable-precedence)

* Conditionals:
  * There is only `when`, no else
  * Available conditionals:
    * `when: guard task execution`
    * `changed_when: define change state`
    * `failed_when: define failed state`
    * [error handling: ansible.com](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html)
* Template Engine
  * Ansible uses [jinja](http://jinja.pocoo.org/docs/templates/) (but only a part of it)
  * `ansible-doc template`
  * All is based around [yaml](https://yaml-multiline.info/)
  * Iterations are possible via two ways:
    * Template engine: `{% for ... %}`
    * Ansible built in: `with_`-lookups
* Hostvars
  * Global data structure accessible by **all** hosts
  * `ansible_facts` and `meta`-variables like:
    * `groups`
    * `group_names`
    * `inventory_hostname`
    * `inventory_hostname_short`
    * and so one
  * There are additional fact software like `facter` or `lenses` available
    * Search for ansible modules `package_facts` if you want to know more
* Authentication
  * Is the transportlayer and called `connection` in ansible
  * Default connection is `ssh`
  * Check `ansible-dock --list --type connection`
* Authorization
  * Is the privilege escalation and called `become` in ansible
  * Default become is `sudo`
  * Check `ansible-dock --list --type become`

## Playbook

* Execute a `ansible-playbook my_playbook.yaml`
* One Playbook can contain multiple tasks
* Links:
  * [create reusable playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)
  * [faster playbook execution: redhat.com](https://www.redhat.com/sysadmin/faster-ansible-playbook-execution)
  * [introduction into playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)

### Useful command line calls to understand an existing playbook

```bash
#list all available tags
ansible-playbook playbook.ymk --list-tags

#list all available tasks
ansible-playbook playbook.ymk --list-tasks

#list all available tasks filtered by a tag
ansible-playbook playbook.ymk --list-tasks --tags=install

#list all available tasks excluded by a tag
ansible-playbook playbook.ymk --list-tasks --skip-tags=install
```

### Execute a playbook with a parallelism level of 13

```bash
ansible-playbook playbook.yml -f 13
#check syntax with
ansible-playbook playbook.yml --syntax-check
#list affected hosts
ansible-playbook playbook.yml --list-hosts
#increase verbosity
ansible-playbook playbook.yml --verbose
#provision a different host
ansible-playboot [-i <path to the ini>] -l <hostname> <playbook> [-vvvv]
```

## Sudo password with ansible vault

### By using your playbook

```bash
#@see: https://www.shellhacks.com/ansible-vault-encrypt-decrypt-string/
#will output your encrypted string
ansible-vault encrypt_string '<string: password>' --name '<string: variable_name>'

#now insert your stuff into your playbook
- name: "Set variables"
  set_fact:
    user_name: "admin"
    user_password: !vault |
      $ANSIBLE_VAULT;1.1:AES256
      <string: lots of funny characters>
- debug:
    msg "The user '{{ user_name }}' has the password '{{ user_password }}'"

#how to decrypt the run
#either by cli call
ansible-playboot playbook-yml -i investory.ini --ask-vault-pass

#or by storing the password in a text file
#REMEMBER, put the file name in your .gitignore!
echo "<string: vault password>" >> vault.txt
echo "vault.txt" >> .gitignore
chmod 500 vault.tyt
ansible-playboot playbook-yml -i investory.ini --vault-password-file=vault.txt
```

### By using a dedicated file

```bash
#create a file for the password
#   this file will be secured by a password
ansible-vault edit my_password_vault.yml
#add the following line
#ansible_become_password: <my_P@33w0rD>

#create a file that contains the vault password
echo "<vault password>" > vault_password.txt

#set correct rights and add this to the .gitignore
chmod 600 vault_password.txt
echo "vault_password.txt" >> .gitignore

#now run all
ansible-playbook playbook.yml -i inventory.ini \
    -e '@my_password_vault.yml' \
    --vault-password-file=vault_password.txt
```

[source](https://www.shellhacks.com/ansible-sudo-a-password-is-required/) - 20211105

## Import vs include

* import - static (inheritance is working fine for tags)
* include - dynamic (you have to explicitly apply the tags)

## Make output more human readable

```bash
#@see: https://www.shellhacks.com/ansible-human-readable-output-format/
##on the command line to test
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml

##in the ansible.cfg
[defaults]
# Human-readable output
stdout_callback=yaml
# callback_plugins - defines the list of available plugins
# You can configure multiple callbacks in parallel
# see: ansible-doc --list --type callback
```

## Links

* [ansible cheat sheet](https://opensource.com/article/20/11/ansible-cheat-sheet) - 20201119
* [official site - ansible.com](https://www.ansible.com) - 20200211
* [official documentation](https://docs.ansible.com) - 20200211
    * [install ansible](https://docs.ansible.com/ansible/latest/index.html) - 20200211
    * [configure ansible](https://docs.ansible.com/ansible/latest/user_guide/index.html) - 20200211
* [configuration management - wikipedia.org](https://en.wikipedia.org/wiki/Configuration_management)
* [lineinfile module - fabian-affolter.ch](http://fabian-affolter.ch/blog/the-lineinfile-module-of-ansible/#comment-4707)
* [How do ansible tags work? - percona.com](https://www.percona.com/blog/2020/04/27/how-do-ansible-tags-work/) - 20200428

