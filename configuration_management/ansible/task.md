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
