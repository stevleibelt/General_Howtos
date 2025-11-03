# Install zfs as dkms

## How To

```bash
#!/bin/bash
####
# Install or update zfs as dkms
####
# ref: https://dietpi.com/forum/t/solved-zfs-support-in-dietpi/22118/19
####

function _echo_debug() {
  echo "[DEBUG]: ${1}"
}

function _echo_error() {
  echo ":: Error"
  echo "   ${1}"
}

function _echo_info() {
  echo "[INFO]: ${1}"
}

function _update_arc_max_and_min_configuration() {
  local CURRENT_SYSTEM_MEMORY
  local FILE_PATH_TO_ZFS_CONF

  CURRENT_SYSTEM_MEMORY=$(grep MemTotal /proc/meminfo | tr -dc '[:digit:]')
  FILE_PATH_TO_ZFS_CONF="/etc/modprobe.d/zfs_arc_max_and_min.conf"

  if [[ -f "${FILE_PATH_TO_ZFS_CONF}" ]];
  then
    sudo rm "${FILE_PATH_TO_ZFS_CONF}"
  fi

  #less or equal 4 gb
  if [[ ${CURRENT_SYSTEM_MEMORY} -le 4194304 ]];
  then
    echo "   Less or exact than 4 GB of memory, setting arc size to 256 MB"
    sudo bash -c "echo \"options zfs zfs_arc_min=131072\" > ${FILE_PATH_TO_ZFS_CONF}"
    sudo bash -c "echo \"options zfs zfs_arc_max=262144\" > ${FILE_PATH_TO_ZFS_CONF}"
  #8 gb
  elif [[ ${CURRENT_SYSTEM_MEMORY} -le 8388608 ]];
  then
    echo "   Less or exact than 8 GB of memory, setting arc size to 512 MB"
    sudo bash -c "echo \"options zfs zfs_arc_min=262144\" > ${FILE_PATH_TO_ZFS_CONF}"
    sudo bash -c "echo \"options zfs zfs_arc_max=524288\" > ${FILE_PATH_TO_ZFS_CONF}"
  #16 gb
  elif [[ ${CURRENT_SYSTEM_MEMORY} -le 16777216 ]];
  then
    echo "   Less or exact than 16 GB of memory, setting arc size to 1 GB"
    sudo bash -c "echo \"options zfs zfs_arc_min=524288\" > ${FILE_PATH_TO_ZFS_CONF}"
    sudo bash -c "echo \"options zfs zfs_arc_max=1048576\" > ${FILE_PATH_TO_ZFS_CONF}"
  elif [[ ${CURRENT_SYSTEM_MEMORY} -le 33554432 ]];
  then
    echo "   Less or exact than 32 GB of memory, setting arc size to 2 GB"
    sudo bash -c "echo \"options zfs zfs_arc_min=1048576\" > ${FILE_PATH_TO_ZFS_CONF}"
    sudo bash -c "echo \"options zfs zfs_arc_max=2097152\" > ${FILE_PATH_TO_ZFS_CONF}"
  else
    echo "   More than 32 GB of memory, setting arc size to 4 GB"
    sudo bash -c "echo \"options zfs zfs_arc_min=2097152\" > ${FILE_PATH_TO_ZFS_CONF}"
    sudo bash -c "echo \"options zfs zfs_arc_max=4194304\" > ${FILE_PATH_TO_ZFS_CONF}"
  fi

  if [[ ${?} -eq 0 ]];
  then
    _echo_debug "   Adapted >>${FILE_PATH_TO_ZFS_CONF}<< with fitting option."
  else
    _echo_error "   Could not set arc size option in >>${FILE_PATH_TO_ZFS_CONF}<<."
  fi
}

function _main() {
  local CURRENT_KERNEL

  CURRENT_KERNEL=$(uname -r)

  if apt-cache search linux-headers-${CURRENT_KERNEL} | grep -q linux-headers;
  then
     _echo_debug "Found linux-headers-${CURRENT_KERNEL})"
     _echo_debug "Enable contrib repository"
     sudo sed -r -i'.BAK' 's/^deb(.*)$/deb\1 contrib/g'
     sudo apt-get update
     sudo apt-get install linux-headers-${CURRENT_KERNEL} zfsutils-linux zfs-dkms zfs-zed

     _echo_debug "Updating zfs arc size configuration"
     _update_arc_max_and_min_configuration
     sudo update-initramfs -u -k all

     _echo_info "Testing zfs module"
     modprobe zfs
     zfs version

     _echo_info "Listing installed dkms modules"
     dkms status
  else
    _echo_error "Could not find a linux-headers-${CURRENT_KERNEL} package"
    return 1
  fi
}

_main "${@}"
```

## Links

* [(SOLVED) ZFS support in DietPi: diepti.com](https://dietpi.com/forum/t/solved-zfs-support-in-dietpi/22118) - 20251103
* [Install OpenZFS on debian: openzfs.github.io](https://openzfs.github.io/openzfs-docs/Getting%20Started/Debian/index.html) - 20251103
* [ZFS: debian.org](https://wiki.debian.org/ZFS) - 20251103
