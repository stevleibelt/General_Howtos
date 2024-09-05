# Install Jailmaker

Jailmaker will ease up running docker compose files in your TrueNAS Scale while keeping your media directories clean.

## Installation Steps

* In the admin browser Interface of your TrueNAS Scale: `Datasets` -> `Add Dataset`
  * Create the following strucutre
```bash
# as example tank root
/mnt/tank/jail
/mnt/tank/jail/jailmaker
/mnt/tank/jail/docker
/mnt/tank/jail/docker/data
/mnt/tank/jail/docker/stag
```
* In the admin browser Interface of your TrueNAS Scale: `System Settings` -> `Shell`
  * cd `/mnt/tank/jailmaker`
  * `git clone https://github.com/Jip-Hop/jailmaker .`
  * Test if all is working by running `/jlmkr.py list`
* In the admin browser Interface of your TrueNAS Scale: `System Settings` -> `Advanced` -> `Init/Shotdown Scripts` -> `Add`
  * Description: `start jailmaker`
  * Type: `Command`
  * Command: `/mnt/tank/jailmaker/jlmkr.py startup`
  * When: `Post init`
  * Timeout: 30
* In the admin browser Interface of your TrueNAS Scale: `System Settings` -> `Shell`
  * `/mnt/tank/jailmaker/jlmkr.py create`
  * Select the option to past in the configuration file
    * Insert the content of [this](https://raw.githubusercontent.com/Jip-Hop/jailmaker/main/templates/docker/config) docker configuration file
    * Edit the configuration if needed, `0` means `FALSE`, `1` means `TRUE`
    * Adapt `startup` to `1` to start this jail when the host is starting
    * Adapt `macvlan` to your interface (this is the area where you should set your bridge if you use a bridge interface)
      * Replace `macvlan` with `bridge`
      * Add your bridge name like `br0`
    * In the same `systemd_nspawn_user_args` section, add the following line
      * `--bind='/mnt/tank/docker/data:/mnt/data'`
      * `--bind='/mnt/tank/docker/stacks:/opt/stacks'`
      * As example for more binds: `--bind-ro='/mnt/tank/media/video:/mnt/media'`
    * Enter jail name: `docker`
    * Start it now: `y`
```bash
jlmkr shell docker
# Please follow the [networking](https://github.com/Jip-Hop/jailmaker/blob/main/docs/network.md) documentation to setup a static ip address
cd /opt/stacks
cat > install_dockge.sh <<DELIM
# ref: https://github.com/louislam/dockge
# Create directories that store your stacks and stores Dockge's stack
mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge

# Download the compose.yaml
curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml

# Start the server
docker compose up -d
DELIM

sh install_dockge.sh
```
* Use your browser and open `http:/<string: ip_address>:5001`
  * Set username and password
  
* Hints
  * The docker jail/sandbox is a debian system
  * If you have an issue in your network configuration, the jail won't start
  * You can edit an existing configuration by running `jlmkr edit docker` (if you want to edit the docker jail configuration)
  * You can restart a jail by running `jlmkr restart docker`
  * You can enter a jail by running `jlmkr shell docker`
    * Set a static ip if you want to

## Links

* [Dockge: github.com](https://github.com/louislam/dockge) - 20240901
* [Setting up Sandboxes with Jailmaker: youtube.com](https://www.youtube.com/watch?v=S0nTRvAHAP8) - 202040901
* [systemd-nspawn: man7.org](https://www.man7.org/linux/man-pages/man1/systemd-nspawn.1.html) - 20240904
