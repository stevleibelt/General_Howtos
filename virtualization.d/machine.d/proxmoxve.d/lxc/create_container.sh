#!/bin/bash
####
# Creates a new lxc container machine
####
# @todo:
#   add support for --dns-server
#   add support for --gateway
#   add support for --domain
#   add support for --ip-subnet
#   add support for --disk-size
#   add support for --memory-size
#   add support for --cpu-cores
#   add support for --swap-size
# @since: 20211214
# @author: stev leibelt <artodeto@bazzline.net>
####

####
# @param <string: ip address to ping
####
function _wait_for_server_start()
{
    local CURRENT_RUN=0
    local IP_ADDRESS=${1}

    while [[ ${CURRENT_RUN} -le 10 ]];
    do
        ping -c 1 ${IP_ADDRESS} > null 2>&1

        if [[ "${?}" = "0" ]];
        then
            return 0
        fi
    done

    return 1
}

function _create_container()
{
    #bo: variable declaration
    local BE_VERBOSE=0
    local CONTAINER_CPU_CORES=2
    local CONTAINER_DISK_POOL='zfs-pool'
    local CONTAINER_DISK_SIZE=32 #in gigabytes
    local CONTAINER_DOMAIN='bazzline.net'
    local CONTAINER_DNS_SERVER='213.73.91.35'
    local CONTAINER_GATEWAY='192.168.1.1'
    local CONTAINER_HOSTNAME=''
    local CONTAINER_IP_ADDRESS=''
    local CONTAINER_IP_SUBNET='192.168.1'
    local CONTAINER_MEMORY_SIZE=2048    #in megabytes
    local CONTAINER_OS_IMAGE_PATH=''
    local CONTAINER_OS_TYPE=''
    local CONTAINER_ROOT_PASSWORD=''
    local CONTAINER_SWAP_SIZE=512   #in megabytes
    local CONTAINER_SSH_PUBLIC_KEY=''
    local NAME_OF_THIS_SCRIPT=$(basename "${0}")
    local SHOW_USAGE=0
    #eo: variable declaration

    #bo: user input fetching
    while true;
    do
        case "${1}" in
            "-h" | "--help" )
                SHOW_USAGE=1
                shift 1
                ;;
            "--hostname" )
                CONTAINER_HOSTNAME=${2}
                shift 2
                ;;
            "--ip-address" )
                CONTAINER_IP_ADDRESS=${2}
                shift 2
                ;;
            "--os-image-path" )
                CONTAINER_OS_IMAGE_PATH=${2}
                shift 2
                ;;
            "--os-type" )
                CONTAINER_OS_TYPE=${2}
                shift 2
                ;;
            "--public-ssh-key" )
                CONTAINER_SSH_PUBLIC_KEY=${2}
                shift 2
                ;;
            "--root-password" )
                CONTAINER_ROOT_PASSWORD=${2}
                shift 2
                ;;
            "-v" | "--verbose" )
                BE_VERBOSE=1
                ;;
            *)
                break
                ;;
        esac
    done
    #eo: user input fetching

    #bo: user input validation
    if [[ ${SHOW_USAGE} -eq 1 ]];
    then
        echo ":: Usage"
        echo "   ${NAME_OF_THIS_SCRIPT} --hostname <string: hostname> --ip-address <string: ip address> --root-password <string: root password> --public-ssh-key <string: public ssh key> --os-image-path <string: path to the os-image.tar.xz> --os-type <string: os type like centos> [-h|--help] [-v|--verbose]"

        return 0
    fi

    if [[ "${CONTAINER_HOSTNAME}" = "" ]];
    then
        echo ":: Invalid hostname provided."
        echo "   >>${CONTAINER_HOSTNAME}<<"

        return 101
    fi

    if [[ "${CONTAINER_IP_ADDRESS}" = "" ]];
    then
        echo ":: Invalid ip address provided."
        echo "   >>${CONTAINER_IP_ADDRESS}<<"

        return 102
    fi

    if [[ "${CONTAINER_OS_IMAGE_PATH}" = "" ]];
    then
        echo ":: Invalid os image path provided."
        echo "   >>${CONTAINER_OS_IMAGE_PATH}<<"

        return 103
    fi

    if [[ ! -f "${CONTAINER_OS_IMAGE_PATH}" ]];
    then
        echo ":: Invalid os image path provided."
        echo "   >>${CONTAINER_OS_IMAGE_PATH}<<"

        return 103
    fi

    if [[ "${CONTAINER_OS_TYPE}" = "" ]];
    then
        echo ":: Invalid os type provided."
        echo "   >>${CONTAINER_OS_TYPE}<<"

        return 104
    fi

    if [[ "${CONTAINER_ROOT_PASSWORD}" = "" ]];
    then
        echo ":: Invalid root password provided."
        echo "   >>${CONTAINER_ROOT_PASSWORD}<<"

        return 105
    fi

    if [[ "${CONTAINER_SSH_PUBLIC_KEY}" = "" ]];
    then
        echo ":: Invalid ssh public key provided."
        echo "   >>${CONTAINER_SSH_PUBLIC_KEY}<<"

        return 106
    fi
    #eo: user input validation

    #bo: container creation
    local NEXT_LXC_ID=$(pvesh get /cluster/nextid)
    pct create ${NEXT_LXC_ID} \
        ${CONTAINER_OS_IMAGE_PATH} \
        --rootfs ${CONTAINER_DISK_POOL}:${CONTAINER_DISK_SIZE} \
        --cores ${CONTAINER_CPU_CORES} \
        --memory ${CONTAINER_MEMORY_SIZE} \
        --swap ${CONTAINER_SWAP_SIZE} \
        --hostname "${CONTAINER_HOSTNAME}.${CONTAINER_DOMAIN}" \
        --nameserver "${CONTAINER_DNS_SERVER}" \
        --searchdomain "${CONTAINER_DOMAIN}" \
        --net0 name=eth0,bridge=vmbr0,firewall=0,gw=${CONTAINER_GATEWAY},ip=${CONTAINER_IP_ADDRESS}/24,type=veth \
        --ostype ${CONTAINER_OS_TYPE} \
        --start 1 \
        --onboot 1 \
        --description "automatically generated"
    #eo: container creation

    #bo: wait for creation
    _wait_for_server_start "${CONTAINER_IP_ADDRESS}"
    #eo: wait for creation

    #bo: install default software
    #maybe use a setup.sh file we execute here
    #lxc-attach -n ${NEXT_LXC_ID} -- yum install -y openssh-server
    #eo: install default software

    #bo: output
    echo ""
    echo ":: LXC Container created."

    echo ""
    echo "   Hostname >>${CONTAINER_HOSTNAME}.${CONTAINER_DOMAIN}<<"
    echo "   IP Address >>${CONTAINER_IP_ADDRESS}<<"
    echo ""
    #eo: output
}

_create_container $@
