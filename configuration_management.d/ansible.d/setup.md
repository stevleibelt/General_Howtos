# Ansible Setup

## Simple setup

### Client node

```bash
# client as example for debian
# install
sudo apt install ansible

# check
ansible -m ping localhost
ansible -m command -a -uptime localhost

# add ansible user
# add ssh key
```

### Controll node

```bash
# create a working directory for your current ansible environment
mkdir my_ansible_project
cd my_ansible_project
ansible-config init --disabled > ansible.cfg
# open ansible.cfg and configure the following lines
#   inventory = ./inventory.ini

cat > inventory.ini <<DELIM
# just a hostname
hostname
# or a configured host
ssh-config-host
# or an ip address
ip_address
DELIM

# test
ansible -i ansible/inventory.ini -m ping all

# create role
ansible-galaxy role init roles/my_role
```

