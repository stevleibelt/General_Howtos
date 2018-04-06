# terms

* playbook
* task
* handler
* inventory -  matching list of servers to groups
* roles - package of taks, variable,s handlers, modules and other plugins
* groups

# playbook

* [introduction into playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)
* [create reusable playbooks](http://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)

## execute a playbook with a parallelism level of 13

```
ansible-playbook playbook.yml -f 13
#check syntax with
ansible-playbook playbook.yml --syntax-check
#list affected hosts
ansible-playbook playbook.yml --list-hosts
#increase verbosity
ansible-playbook playbook.yml --verbose
```

## import vs include

* import - static
* include - dynamic

# links

* http://www.ansible.com
* http://docs.ansible.com
* http://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html#foreword
* https://en.wikipedia.org/wiki/Configuration_management
* http://fabian-affolter.ch/blog/the-lineinfile-module-of-ansible/#comment-4707
