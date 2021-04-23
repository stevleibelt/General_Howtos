# Ansible

# Terms

* playbook
* [task](task.md)
* handler
* [inventory](inventory.md) -  matching list of servers to groups
* roles - package of taks, variable,s handlers, modules and other plugins
* groups

# Playbook

* [introduction into playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)
* [create reusable playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)

## Useful command line calls to understand an existing playbook

```
#list all available tags
ansible-playbook playbook.ymk --list-tags

#list all available tasks
ansible-playbook playbook.ymk --list-tasks

#list all available tasks filtered by a tag
ansible-playbook playbook.ymk --list-tasks --tags=install

#list all available tasks excluded by a tag
ansible-playbook playbook.ymk --list-tasks --skip-tags=install
```

## execute a playbook with a parallelism level of 13

```
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

## Import vs include

* import - static (inheritance is working fine for tags)
* include - dynamic (you have to explicitly apply the tags)

## Make output more human readable

```
#@see: https://www.shellhacks.com/ansible-human-readable-output-format/
##on the command line to test
ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook playbook.yml

##in the ansible.cfg
[defaults]
# Human-readable output
stdout_callback = yaml
```

# Links

* [ansible cheat sheet](https://opensource.com/article/20/11/ansible-cheat-sheet) - 20201119
* [official site - ansible.com](https://www.ansible.com) - 20200211
* [official documentation](https://docs.ansible.com) - 20200211
    * [install ansible](https://docs.ansible.com/ansible/latest/index.html) - 20200211
    * [configure ansible](https://docs.ansible.com/ansible/latest/user_guide/index.html) - 20200211
* [configuration management - wikipedia.org](https://en.wikipedia.org/wiki/Configuration_management)
* [lineinfile module - fabian-affolter.ch](http://fabian-affolter.ch/blog/the-lineinfile-module-of-ansible/#comment-4707)
* [How do ansible tags work? - percona.com](https://www.percona.com/blog/2020/04/27/how-do-ansible-tags-work/) - 20200428
