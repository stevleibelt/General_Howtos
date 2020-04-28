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

## useful command line calls to understand an existing playbook

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

## import vs include

* import - static (inheritance is working fine for tags)
* include - dynamic (you have to explicitly apply the tags)

# links

* [official site - ansible.com](https://www.ansible.com) - 2020-02-11
* [official documentation](https://docs.ansible.com) - 2020-02-11
    * [install ansible](https://docs.ansible.com/ansible/latest/index.html) - 2020-02-11
    * [configure ansible](https://docs.ansible.com/ansible/latest/user_guide/index.html) - 2020-02-11
* [configuration management - wikipedia.org](https://en.wikipedia.org/wiki/Configuration_management)
* [lineinfile module - fabian-affolter.ch](http://fabian-affolter.ch/blog/the-lineinfile-module-of-ansible/#comment-4707)
* [How do ansible tags work? - percona.com](https://www.percona.com/blog/2020/04/27/how-do-ansible-tags-work/) - 2020-04-28
