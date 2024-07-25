# Ansible examples

## Simplest of all tests

* `ansible -m ping all`
* `ansible -m command -a uptime all`
  * `-m`: module
  - `-a`: module arguments

## Execute your yaml files as a dry run

`ansible-playbook my_playbook.yaml -CD`
* `-C`: Start with check-mode (dry run)
* `-D`: Start in diff-mode

# Default connection (ssh) configuration

* Adapt `ansible.cfg`
  * `host_key_checking=accept-new`
  * `private_key_file=./my_key`

## Create a simple vault

* Create a vault password: `openssl rand -hex 8 > ~/.ansible_vault`
* Adapt `ansible.cfg`: `vault_password_file=./.ansible_vault`
* Encrypt your password: `echo 'my_username: my password' > group_vars/my_group/secrets.yaml`
* Encrypt your files: `ansible-vault encrypt group_vars/my_group/secrets.yaml`
  * **Note**: The vaul passwords will only be used/asked for, if the machines in a playbook belong to the group with the secrets
* Usage: `ansible-playbook my_playbook.yaml --ask-vault-pass`
* Adapt `ansible.cfg` `vault_identity_list` (like `dev`, `stage`, `prod`)
* To be able to grep for username, you could create two files
  * `group_vars/my_group/users.yaml` like
```yaml
var_users:
  foo:
    full_name: ...
    name: ...
```
  * `group_vars/my_group/secrets.yaml` like
```yaml
var_user_secrets:
  foo:
    password: ...
```
* You need to merge the `user_secrets` into the `users` in your task
```yaml
- name: Create var_users_with_secret
  ansible.builtin.set_fact:
    var_users_with_secret: "{{ var-users | combine(var_user_secrets, recursive=True) }}"

- name: Dump var_users_with_secret
  ansible.builtin.debug:
    var: "{{ item }}"
  loop: "{{ var_users_with_secret | dict2items }}"
```
* List content of a vault: `ansible-vault group_vars/my_group/secrets.yaml`

## Change standard output to yaml

* Adapt `ansible.cfg`
* `stdout_callback=yaml`
* [playbook error handling: ansible.com](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html)

## Using bitwarden as ansible vault replacement

* Install ansible collection
* `ansible-galaxy collection install bitwarden.secrets`
* Setup env variable (the auth token)
* `export BWS_ACCESS_TOKEN=<string: auth_token>` or set it in the ansible.cfg (if supported)
* Links
  * [bitwarden secrets collection]https://galaxy.ansible.com/ui/repo/published/bitwarden/secrets/
  * [code repository](https://github.com/bitwarden/sm-ansible)
  * [documentation](https://bitwarden.com/products/secrets-manager/)

## Configure a persistent cache

* Adapt `ansible.cfg`
  * `;gathering=implicit`
  * `fact_caching=jsonfile`
  * `fact_caching_connection=./facts`

## Using filters for slicing and dicing the data

* [ref](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_filters.html)
* There are three ways to check if a variable idefined
```yaml
# default filter
{{ my_varialbe | default('this is fine') }}

# via when expression
when: my_variable is defined

# via template
if my_variable is defined

# bonus, use jinja filter
#  if my_variable is not defined, my_parameter is omitted from the output
my_parameter: "{{ my_variable | default(omit) }}"
```

## Using filters in general

```yaml
# set default if not set
"{{ foo | default('bar') }}"

# requires present of a varialbe
"{{ foo | mandatory }}"

# transform content to
"{{ foo | no_json }}"
"{{ foo | no_nice_json }}"
"{{ foo | no_nice_yaml }}"
"{{ foo | no_yaml }}"
```
