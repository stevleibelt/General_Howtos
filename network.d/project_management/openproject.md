# OpenProject

## Installation

### General

* default administrator is: admin/admin

### Podman

### Quickly test ist

```bash
cat >/path/to/your/start.sh<<DELIM
#!/bin/bash
podman run -d -p 8080:80 -e SECRET_KEY_BASE=<your_secret> openproject/community:11
DELIM

bash start.sh

#fetch container id
podman ps

#open shell
podman container exec -it <container_id> /bin/bash
```

#### Set it up

```bash
#create your container
podman container create docker.io/openproject/community:11 -name openproject -p 8080:80 -e SECRET_KEY_BASE=<your_secret>

#start it
podman container start openproject -d

#stop it
podman container stop openproject
```

## Links

* [Official user guide: openproject.org](https://www.openproject.org/docs/user-guide/)
* [Offizielles Benutzerhandbuch: openproject.org](https://www.openproject.org/de/docs/nutzungshandbuch/)
