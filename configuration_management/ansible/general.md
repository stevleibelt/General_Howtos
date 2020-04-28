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
#provision a different host
ansible-playboot [-i <path to the ini>] -l <hostname> <playbook> [-vvvv]
```

## import vs include

* import - static
* include - dynamic

# links

* [official site - ansible.com](https://www.ansible.com) - 2020-02-11
* [official documentation](https://docs.ansible.com) - 2020-02-11
    * [install ansible](https://docs.ansible.com/ansible/latest/index.html) - 2020-02-11
    * [configure ansible](https://docs.ansible.com/ansible/latest/user_guide/index.html) - 2020-02-11
* [configuration management - wikipedia.org](https://en.wikipedia.org/wiki/Configuration_management)
* [lineinfile module - fabian-affolter.ch](http://fabian-affolter.ch/blog/the-lineinfile-module-of-ansible/#comment-4707)
* [How do ansible tags work? - percona.com](https://www.percona.com/blog/2020/04/27/how-do-ansible-tags-work/) - 2020-04-28
