# examples

## use the stdout of an command as condition

```yml
- name: This counts the number of lines
  command: ls -halt / | wc -l
  register: number_of_directories_in_the_root

- name: An example task that could be triggered
  notify:
    - cleanup_disk
  when: number_of_directories_in_the_root.stdout > 30
```

## check if file exists

```yml
# links:
#   https://raymii.org/s/tutorials/Ansible_-_Only_if_a_file_exists_or_does_not_exist.html
#   https://www.shellhacks.com/ansible-check-if-file-exists/

- name: Get status of <your file>
  stat: <path to your file>
  register: your_file_status

- name:
  template:
    src=<path to you template>
    dest=<destination path>
    owner=<owner>
    group=<group>
  when: your_file_status.exists = False
#when: your_file_status.isdir = False
#when: your_file_status.islnk = False
```

## execute shell script

```yml
# links:
#   http://docs.ansible.com/ansible/script_module.html
- name: Execute via shell
  shell: my_script.sh #you can use "<", ">", ">>" etc

#   https://www.shellhacks.com/ansible-run-shell-command-on-remote-host/
- name: "Execute multiple commands"
  shell: |
    whoami
    uptime & uname -a
    echo "Test" > /dev/null

#   http://docs.ansible.com/ansible/shell_module.html
- name: Execute via command
  command: my_script.sh

#   http://docs.ansible.com/ansible/command_module.html
- name: Execut via script
  script: <path to>/my_script.sh an_argument another_argument
```

## write an os dependend task

```yml
- name: import task for redhat
  import_tasks: redhat.yml
  when: ansible_os_family == 'RedHat'

- name: import task for debian
  import_tasks: debian.yml
  when: ansible_os_family == 'Debian'
```

## comment in or out a line in a file

```yml
#@see: https://www.shellhacks.com/ansible-comment-out-uncomment-lines-in-a-file/
#   the line with >>replace<< says "put a >>#<< in front of the matched content"
- name: "comment out the line containting something like >>foo=<int><<"
  replace:
    path: /path/to/the/file
    regexp: '^\s*(foo=.*)'
    replace '#\1'

- name: "comment in the line containting something like >>#foo=<int><<"
  replace:
    path: /path/to/the/file
    regexp: '^\s*#*\s(foo=.*)'
    replace '#\1'
```

# links

* http://docs.ansible.com/ansible/shell_module.html
* http://docs.ansible.com/ansible/playbooks_conditionals.html
* http://docs.ansible.com/ansible/playbooks_variables.html#registered-variables
