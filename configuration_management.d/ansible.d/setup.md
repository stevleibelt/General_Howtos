# Setup

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
# create and fill inventory
mkdir ansible
cat > ansible/inventory.ini <<DELIM
# just a hostname
hostname
# or a configured host
ssh-config-host
# or an ip address
ip_address
DELIM

# test
ansible -i ansible/inventory.ini -m ping all
```

