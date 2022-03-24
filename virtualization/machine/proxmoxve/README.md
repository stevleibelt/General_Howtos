# Installation

* [download](https://www.proxmox.com/en/downloads/category/iso-images-pve) iso
* `sudo dd if=proxmox-ve_*.dmg of=/dev/rdiskX bs=1m` (if you use rufus, use `dd mode`)
* `vim /etc/apt/sources.list.d/pve-enterprise.list`, comment out the line there
* `echo "deb [trusted=yes] http://www.deb-multimedia.org buster main" > /etc/apt/sources.list.d/pve-no-subscription`
    * [see](https://www.svennd.be/proxmox-ve-5-0-fix-updates-upgrades/)

# Upgrade

* [upgrade from proxmoxve 6 to proxmoxve 7](https://pve.proxmox.com/wiki/Upgrade_from_6.x_to_7.0)

# HowTos

## Backup node configuration

* configure local mounted remove backup storage
* ssh into the node
* replace `your-local-mounted-remote-backup-storage` with a valid path

```
cat > /etc/pve/sync_to_backup.sh <<DELIM
#!/bin/bash
####
# Synchronize all important configuration files to target
####
# @see
#       https://forum.proxmox.com/threads/how-to-backup-proxmox-configuration-files.67789/page-2
#       https://github.com/DerDanilo/proxmox-stuff
# @author stev leibelt <artodeto@bazzline.net>
# @since 2021-11-09
####

function _local_sync_configuration_to_target ()
{
        local SOURCE_PATH="/etc/pve"
        local TARGET_PATH="/mnt/pve/your-local-mounted-remote-backup-storage/nodes/${HOSTNAME}"

        if [[ ! -d ${TARGET_PATH} ]];
        then
            mkdir -p ${TARGET_PATH}
        fi

        rsync --delete -avz ${SOURCE_PATH} ${TARGET_PATH}
}

_local_sync_configuration_to_target
DELIM

cat > /etc/cron.d/synctobackup <<DELIM
# cluster wide nodes backup cron schedule
# Manually generated file - do not edit

PATH="/usr/sbin:/usr/bin:/sbin:/bin"

0 2 * * *           root /etc/pve/sync_to_backup.sh
DELIM
```

## NTP

```
timedatectl set-timezone Europe/Berlin

apt install systemd-timesyncd

cat > /etc/systemd/timesyncd.conf <<DELIM
[Time]
#set your ntp servers
NTP=europe.pool.ntp.org de.pool.ntp.org
DELIM

systemctl restart systemd-timesyncd
systemctl status systemd-timesyncd
systemctl enable systemd-timesyncd

#check
timedatectl

#verbose output
timedatectl show-timesync --all
```

## Remove Node from Cluster

```
#login to an active node you do NOT want to remove
#list nodes
pvecm nodes

#remove node you want to
pvecm delnode <NodeName>

#list nodes and check of the node has been removed
pvecm nodes

#check web gui if node is removed
#check /etc/pve/nodes folder if node is removed
#   remove folder of /etc/pve/nodes/<NodeName>
```

# HowTo

## Stop hanging machine

See [here](https://bobcares.com/blog/proxmox-cant-stop-vm/) (20220317) if you want to know more.

Mostly this can happen because a backup is running.

```
#try to unlock it first
qm unlock <int: vm_id>

#cat /etc/pce/.vmlist
qm stop <int: vm_id>
```

# Links

* [HA Proxmox Cluster with Shared Storage](https://networkingdream.com/server/ha-proxmox-cluster-with-shared-storage/) - 20210930
* [Prepare installation media](https://pve.proxmox.com/wiki/Prepare_Installation_Media) - 20210215
* [Official admin guide](https://pve.proxmox.com/pve-docs/pve-admin-guide.html) - 20210412
* [Official wiki](https://pve.proxmox.com/wiki/Main_Page) - 20210412
* 2021
    * [Proxmox Virtualization -- Automatically deploying new LXC containers](https://blog.nashcom.de/nashcomblog.nsf/dx/proxmox-virtualization-automatically-deploying-new-lxc-containers.htm)
