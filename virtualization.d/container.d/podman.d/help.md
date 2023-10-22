# podman search does not return any entry

* check if there is a registry configured in `/etc/container/registries.conf`
* if notm run the following command as root/sudo
```
cat > /etc/container/registries.conf.d/my_registries.conf <<DELIM
unqualified-search-registries = ['registry.fedoraproject.org', 'registry.access.redhat.com', 'registry.centos.org', 'docker.io']
DELIM
```
* [if you want to know more](https://www.redhat.com/sysadmin/manage-container-registries)
