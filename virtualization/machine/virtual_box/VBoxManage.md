# VBoxManage

```
#Read the whole list of commands and options
VBoxManage | less
```

## Shotcuts

|| Command || Description ||
| VBoxManage list vm | List virtual machines |
| VBoxManage start <uuid|vname> headless | Start a virtual machine in headless mode |
| VBoxManage controlvm <uuid|vname> pause|poweroff | Pause or poweroff virtual machine |

## Whole list of command and options

```
Oracle VM VirtualBox Command Line Management Interface Version 5.1.20
(C) 2005-2017 Oracle Corporation
All rights reserved.

Usage:

  VBoxManage [<general option>] <command>
 
 
General Options:
 
  [-v|--version]            print version number and exit
  [-q|--nologo]             suppress the logo
  [--settingspw <pw>]       provide the settings password
  [--settingspwfile <file>] provide a file containing the settings password
 
 
Commands:
 
  list [--long|-l]          vms|runningvms|ostypes|hostdvds|hostfloppies|
                            intnets|bridgedifs|hostonlyifs|natnets|dhcpservers|
                            hostinfo|hostcpuids|hddbackends|hdds|dvds|floppies|
                            usbhost|usbfilters|systemproperties|extpacks|
                            groups|webcams|screenshotformats

  showvminfo                <uuid|vmname> [--details]
                            [--machinereadable]
  showvminfo                <uuid|vmname> --log <idx>

  registervm                <filename>

  unregistervm              <uuid|vmname> [--delete]

  createvm                  --name <name>
                            [--groups <group>, ...]
                            [--ostype <ostype>]
                            [--register]
                            [--basefolder <path>]
                            [--uuid <uuid>]

  modifyvm                  <uuid|vmname>
                            [--name <name>]
                            [--groups <group>, ...]
                            [--description <desc>]
                            [--ostype <ostype>]
                            [--iconfile <filename>]
                            [--memory <memorysize in MB>]
                            [--pagefusion on|off]
                            [--vram <vramsize in MB>]
                            [--acpi on|off]
                            [--pciattach 03:04.0]
                            [--pciattach 03:04.0@02:01.0]
                            [--pcidetach 03:04.0]
                            [--ioapic on|off]
                            [--hpet on|off]
                            [--triplefaultreset on|off]
                            [--apic on|off]
                            [--x2apic on|off]
                            [--paravirtprovider none|default|legacy|minimal|
                                                hyperv|kvm]
                            [--paravirtdebug <key=value> [,<key=value> ...]]
                            [--hwvirtex on|off]
                            [--nestedpaging on|off]
                            [--largepages on|off]
                            [--vtxvpid on|off]
                            [--vtxux on|off]
                            [--pae on|off]
                            [--longmode on|off]
                            [--cpu-profile "host|Intel 80[86|286|386]"]
                            [--cpuid-portability-level <0..3>
                            [--cpuidset <leaf> <eax> <ebx> <ecx> <edx>]
                            [--cpuidremove <leaf>]
                            [--cpuidremoveall]
                            [--hardwareuuid <uuid>]
                            [--cpus <number>]
                            [--cpuhotplug on|off]
                            [--plugcpu <id>]
                            [--unplugcpu <id>]
                            [--cpuexecutioncap <1-100>]
                            [--rtcuseutc on|off]
                            [--graphicscontroller none|vboxvga|vmsvga]
                            [--monitorcount <number>]
                            [--accelerate3d on|off]
                            [--accelerate2dvideo on|off]
                            [--firmware bios|efi|efi32|efi64]
                            [--chipset ich9|piix3]
                            [--bioslogofadein on|off]
                            [--bioslogofadeout on|off]
                            [--bioslogodisplaytime <msec>]
                            [--bioslogoimagepath <imagepath>]
                            [--biosbootmenu disabled|menuonly|messageandmenu]
                            [--biosapic disabled|apic|x2apic]
                            [--biossystemtimeoffset <msec>]
                            [--biospxedebug on|off]
                            [--boot<1-4> none|floppy|dvd|disk|net>]
                            [--nic<1-N> none|null|nat|bridged|intnet|hostonly|
                                        generic|natnetwork]
                            [--nictype<1-N> Am79C970A|Am79C973|
                                            82540EM|82543GC|82545EM|
                                            virtio]
                            [--cableconnected<1-N> on|off]
                            [--nictrace<1-N> on|off]
                            [--nictracefile<1-N> <filename>]
                            [--nicproperty<1-N> name=[value]]
                            [--nicspeed<1-N> <kbps>]
                            [--nicbootprio<1-N> <priority>]
                            [--nicpromisc<1-N> deny|allow-vms|allow-all]
                            [--nicbandwidthgroup<1-N> none|<name>]
                            [--bridgeadapter<1-N> none|<devicename>]
                            [--hostonlyadapter<1-N> none|<devicename>]
                            [--intnet<1-N> <network name>]
                            [--nat-network<1-N> <network name>]
                            [--nicgenericdrv<1-N> <driver>
                            [--natnet<1-N> <network>|default]
                            [--natsettings<1-N> [<mtu>],[<socksnd>],
                                                [<sockrcv>],[<tcpsnd>],
                                                [<tcprcv>]]
                            [--natpf<1-N> [<rulename>],tcp|udp,[<hostip>],
                                          <hostport>,[<guestip>],<guestport>]
                            [--natpf<1-N> delete <rulename>]
                            [--nattftpprefix<1-N> <prefix>]
                            [--nattftpfile<1-N> <file>]
                            [--nattftpserver<1-N> <ip>]
                            [--natbindip<1-N> <ip>
                            [--natdnspassdomain<1-N> on|off]
                            [--natdnsproxy<1-N> on|off]
                            [--natdnshostresolver<1-N> on|off]
                            [--nataliasmode<1-N> default|[log],[proxyonly],
                                                         [sameports]]
                            [--macaddress<1-N> auto|<mac>]
                            [--mouse ps2|usb|usbtablet|usbmultitouch]
                            [--keyboard ps2|usb
                            [--uart<1-N> off|<I/O base> <IRQ>]
                            [--uartmode<1-N> disconnected|
                                             server <pipe>|
                                             client <pipe>|
                                             tcpserver <port>|
                                             tcpclient <hostname:port>|
                                             file <file>|
                                             <devicename>]
                            [--lpt<1-N> off|<I/O base> <IRQ>]
                            [--lptmode<1-N> <devicename>]
                            [--guestmemoryballoon <balloonsize in MB>]
                            [--audio none|null|oss|alsa|pulse]
                            [--audiocontroller ac97|hda|sb16]
                            [--audiocodec stac9700|ad1980|stac9221|sb16]
                            [--clipboard disabled|hosttoguest|guesttohost|
                                         bidirectional]
                            [--draganddrop disabled|hosttoguest]
                            [--vrde on|off]
                            [--vrdeextpack default|<name>
                            [--vrdeproperty <name=[value]>]
                            [--vrdeport <hostport>]
                            [--vrdeaddress <hostip>]
                            [--vrdeauthtype null|external|guest]
                            [--vrdeauthlibrary default|<name>
                            [--vrdemulticon on|off]
                            [--vrdereusecon on|off]
                            [--vrdevideochannel on|off]
                            [--vrdevideochannelquality <percent>]
                            [--usb on|off]
                            [--usbehci on|off]
                            [--usbxhci on|off]
                            [--usbrename <oldname> <newname>]
                            [--snapshotfolder default|<path>]
                            [--teleporter on|off]
                            [--teleporterport <port>]
                            [--teleporteraddress <address|empty>
                            [--teleporterpassword <password>]
                            [--teleporterpasswordfile <file>|stdin]
                            [--tracing-enabled on|off]
                            [--tracing-config <config-string>]
                            [--tracing-allow-vm-access on|off]
                            [--usbcardreader on|off]
                            [--autostart-enabled on|off]
                            [--autostart-delay <seconds>]
                            [--videocap on|off]
                            [--videocapscreens all|<screen ID> [<screen ID> ...]]
                            [--videocapfile <filename>]
                            [--videocapres <width> <height>]
                            [--videocaprate <rate>]
                            [--videocapfps <fps>]
                            [--videocapmaxtime <ms>]
                            [--videocapmaxsize <MB>]
                            [--videocapopts <key=value> [,<key=value> ...]]
                            [--defaultfrontend default|<name>]

  clonevm                   <uuid|vmname>
                            [--snapshot <uuid>|<name>]
                            [--mode machine|machineandchildren|all]
                            [--options link|keepallmacs|keepnatmacs|
                                       keepdisknames]
                            [--name <name>]
                            [--groups <group>, ...]
                            [--basefolder <basefolder>]
                            [--uuid <uuid>]
                            [--register]

  import                    <ovfname/ovaname>
                            [--dry-run|-n]
                            [--options keepallmacs|keepnatmacs|importtovdi]
                            [more options]
                            (run with -n to have options displayed
                             for a particular OVF)

  export                    <machines> --output|-o <name>.<ovf/ova>
                            [--legacy09|--ovf09|--ovf10|--ovf20]
                            [--manifest]
                            [--iso]
                            [--options manifest|iso|nomacs|nomacsbutnat]
                            [--vsys <number of virtual system>]
                                    [--product <product name>]
                                    [--producturl <product url>]
                                    [--vendor <vendor name>]
                                    [--vendorurl <vendor url>]
                                    [--version <version info>]
                                    [--description <description info>]
                                    [--eula <license text>]
                                    [--eulafile <filename>]

  startvm                   <uuid|vmname>...
                            [--type gui|sdl|headless|separate]

  controlvm                 <uuid|vmname>
                            pause|resume|reset|poweroff|savestate|
                            acpipowerbutton|acpisleepbutton|
                            keyboardputscancode <hex> [<hex> ...]|
                            setlinkstate<1-N> on|off |
                            nic<1-N> null|nat|bridged|intnet|hostonly|generic|
                                     natnetwork [<devicename>] |
                            nictrace<1-N> on|off |
                            nictracefile<1-N> <filename> |
                            nicproperty<1-N> name=[value] |
                            nicpromisc<1-N> deny|allow-vms|allow-all |
                            natpf<1-N> [<rulename>],tcp|udp,[<hostip>],
                                        <hostport>,[<guestip>],<guestport> |
                            natpf<1-N> delete <rulename> |
                            guestmemoryballoon <balloonsize in MB> |
                            usbattach <uuid>|<address>
                                      [--capturefile <filename>] |
                            usbdetach <uuid>|<address> |
                            clipboard disabled|hosttoguest|guesttohost|
                                      bidirectional |
                            draganddrop disabled|hosttoguest |
                            vrde on|off |
                            vrdeport <port> |
                            vrdeproperty <name=[value]> |
                            vrdevideochannelquality <percent> |
                            setvideomodehint <xres> <yres> <bpp>
                                            [[<display>] [<enabled:yes|no> |
                                              [<xorigin> <yorigin>]]] |
                            screenshotpng <file> [display] |
                            videocap on|off |
                            videocapscreens all|none|<screen>,[<screen>...] |
                            videocapfile <file>
                            videocapres <width>x<height>
                            videocaprate <rate>
                            videocapfps <fps>
                            videocapmaxtime <ms>
                            videocapmaxsize <MB>
                            setcredentials <username>
                                           --passwordfile <file> | <password>
                                           <domain>
                                           [--allowlocallogon <yes|no>] |
                            teleport --host <name> --port <port>
                                     [--maxdowntime <msec>]
                                     [--passwordfile <file> |
                                      --password <password>] |
                            plugcpu <id> |
                            unplugcpu <id> |
                            cpuexecutioncap <1-100>
                            webcam <attach [path [settings]]> | <detach [path]> | <list>
                            addencpassword <id>
                                           <password file>|-
                                           [--removeonsuspend <yes|no>]
                            removeencpassword <id>
                            removeallencpasswords

  discardstate              <uuid|vmname>

  adoptstate                <uuid|vmname> <state_file>

  snapshot                  <uuid|vmname>
                            take <name> [--description <desc>] [--live]
                                 [--uniquename Number,Timestamp,Space,Force] |
                            delete <uuid|snapname> |
                            restore <uuid|snapname> |
                            restorecurrent |
                            edit <uuid|snapname>|--current
                                 [--name <name>]
                                 [--description <desc>] |
                            list [--details|--machinereadable]
                            showvminfo <uuid|snapname>

  closemedium               [disk|dvd|floppy] <uuid|filename>
                            [--delete]

  storageattach             <uuid|vmname>
                            --storagectl <name>
                            [--port <number>]
                            [--device <number>]
                            [--type dvddrive|hdd|fdd]
                            [--medium none|emptydrive|additions|
                                      <uuid|filename>|host:<drive>|iscsi]
                            [--mtype normal|writethrough|immutable|shareable|
                                     readonly|multiattach]
                            [--comment <text>]
                            [--setuuid <uuid>]
                            [--setparentuuid <uuid>]
                            [--passthrough on|off]
                            [--tempeject on|off]
                            [--nonrotational on|off]
                            [--discard on|off]
                            [--hotpluggable on|off]
                            [--bandwidthgroup <name>]
                            [--forceunmount]
                            [--server <name>|<ip>]
                            [--target <target>]
                            [--tport <port>]
                            [--lun <lun>]
                            [--encodedlun <lun>]
                            [--username <username>]
                            [--password <password>]
                            [--initiator <initiator>]
                            [--intnet]

  storagectl                <uuid|vmname>
                            --name <name>
                            [--add ide|sata|scsi|floppy|sas|usb|pcie]
                            [--controller LSILogic|LSILogicSAS|BusLogic|
                                          IntelAHCI|PIIX3|PIIX4|ICH6|I82078|
                            [             USB|NVMe]
                            [--portcount <1-n>]
                            [--hostiocache on|off]
                            [--bootable on|off]
                            [--rename <name>]
                            [--remove]

  bandwidthctl              <uuid|vmname>
                            add <name> --type disk|network
                                --limit <megabytes per second>[k|m|g|K|M|G] |
                            set <name>
                                --limit <megabytes per second>[k|m|g|K|M|G] |
                            remove <name> |
                            list [--machinereadable]
                            (limit units: k=kilobit, m=megabit, g=gigabit,
                                          K=kilobyte, M=megabyte, G=gigabyte)

  showmediuminfo            [disk|dvd|floppy] <uuid|filename>

  createmedium              [disk|dvd|floppy] --filename <filename>
                            [--size <megabytes>|--sizebyte <bytes>]
                            [--diffparent <uuid>|<filename>
                            [--format VDI|VMDK|VHD] (default: VDI)
                            [--variant Standard,Fixed,Split2G,Stream,ESX]

  modifymedium              [disk|dvd|floppy] <uuid|filename>
                            [--type normal|writethrough|immutable|shareable|
                                    readonly|multiattach]
                            [--autoreset on|off]
                            [--property <name=[value]>]
                            [--compact]
                            [--resize <megabytes>|--resizebyte <bytes>]
                            [--move <full path to a new location>]
  clonemedium               [disk|dvd|floppy] <uuid|inputfile> <uuid|outputfile>
                            [--format VDI|VMDK|VHD|RAW|<other>]
                            [--variant Standard,Fixed,Split2G,Stream,ESX]
                            [--existing]

  mediumproperty            [disk|dvd|floppy] set <uuid|filename>
                            <property> <value>

                            [disk|dvd|floppy] get <uuid|filename>
                            <property>

                            [disk|dvd|floppy] delete <uuid|filename>
                            <property>

  encryptmedium             <uuid|filename>
                            [--newpassword <file>|-]
                            [--oldpassword <file>|-]
                            [--cipher <cipher identifier>]
                            [--newpasswordid <password identifier>]

  checkmediumpwd            <uuid|filename>
                            <pwd file>|-

  convertfromraw            <filename> <outputfile>
                            [--format VDI|VMDK|VHD]
                            [--variant Standard,Fixed,Split2G,Stream,ESX]
                            [--uuid <uuid>]
  convertfromraw            stdin <outputfile> <bytes>
                            [--format VDI|VMDK|VHD]
                            [--variant Standard,Fixed,Split2G,Stream,ESX]
                            [--uuid <uuid>]

  getextradata              global|<uuid|vmname>
                            <key>|enumerate

  setextradata              global|<uuid|vmname>
                            <key>
                            [<value>] (no value deletes key)

  setproperty               machinefolder default|<folder> |
                            hwvirtexclusive on|off |
                            vrdeauthlibrary default|<library> |
                            websrvauthlibrary default|null|<library> |
                            vrdeextpack null|<library> |
                            autostartdbpath null|<folder> |
                            loghistorycount <value>
                            defaultfrontend default|<name>
                            logginglevel <log setting>

  usbfilter                 add <index,0-N>
                            --target <uuid|vmname>|global
                            --name <string>
                            --action ignore|hold (global filters only)
                            [--active yes|no] (yes)
                            [--vendorid <XXXX>] (null)
                            [--productid <XXXX>] (null)
                            [--revision <IIFF>] (null)
                            [--manufacturer <string>] (null)
                            [--product <string>] (null)
                            [--remote yes|no] (null, VM filters only)
                            [--serialnumber <string>] (null)
                            [--maskedinterfaces <XXXXXXXX>]

  usbfilter                 modify <index,0-N>
                            --target <uuid|vmname>|global
                            [--name <string>]
                            [--action ignore|hold] (global filters only)
                            [--active yes|no]
                            [--vendorid <XXXX>|""]
                            [--productid <XXXX>|""]
                            [--revision <IIFF>|""]
                            [--manufacturer <string>|""]
                            [--product <string>|""]
                            [--remote yes|no] (null, VM filters only)
                            [--serialnumber <string>|""]
                            [--maskedinterfaces <XXXXXXXX>]

  usbfilter                 remove <index,0-N>
                            --target <uuid|vmname>|global

  sharedfolder              add <uuid|vmname>
                            --name <name> --hostpath <hostpath>
                            [--transient] [--readonly] [--automount]

  sharedfolder              remove <uuid|vmname>
                            --name <name> [--transient]

  guestproperty             get <uuid|vmname>
                            <property> [--verbose]

  guestproperty             set <uuid|vmname>
                            <property> [<value> [--flags <flags>]]

  guestproperty             delete|unset <uuid|vmname>
                            <property>

  guestproperty             enumerate <uuid|vmname>
                            [--patterns <patterns>]

  guestproperty             wait <uuid|vmname> <patterns>
                            [--timeout <msec>] [--fail-on-timeout]

  guestcontrol              <uuid|vmname> [--verbose|-v] [--quiet|-q]
                              [--username <name>] [--domain <domain>]
                              [--passwordfile <file> | --password <password>]

                              run [common-options]
                              [--exe <path to executable>] [--timeout <msec>]
                              [-E|--putenv <NAME>[=<VALUE>]] [--unquoted-args]
                              [--ignore-operhaned-processes] [--profile]
                              [--no-wait-stdout|--wait-stdout]
                              [--no-wait-stderr|--wait-stderr]
                              [--dos2unix] [--unix2dos]
                              -- <program/arg0> [argument1] ... [argumentN]]

                              start [common-options]
                              [--exe <path to executable>] [--timeout <msec>]
                              [-E|--putenv <NAME>[=<VALUE>]] [--unquoted-args]
                              [--ignore-operhaned-processes] [--profile]
                              -- <program/arg0> [argument1] ... [argumentN]]

                              copyfrom [common-options]
                              [--dryrun] [--follow] [-R|--recursive]
                              <guest-src0> [guest-src1 [...]] <host-dst>

                              copyfrom [common-options]
                              [--dryrun] [--follow] [-R|--recursive]
                              [--target-directory <host-dst-dir>]
                              <guest-src0> [guest-src1 [...]]

                              copyto [common-options]
                              [--dryrun] [--follow] [-R|--recursive]
                              <host-src0> [host-src1 [...]] <guest-dst>

                              copyto [common-options]
                              [--dryrun] [--follow] [-R|--recursive]
                              [--target-directory <guest-dst>]
                              <host-src0> [host-src1 [...]]

                              mkdir|createdir[ectory] [common-options]
                              [--parents] [--mode <mode>]
                              <guest directory> [...]

                              rmdir|removedir[ectory] [common-options]
                              [-R|--recursive]
                              <guest directory> [...]

                              removefile|rm [common-options] [-f|--force]
                              <guest file> [...]

                              mv|move|ren[ame] [common-options]
                              <source> [source1 [...]] <dest>

                              mktemp|createtemp[orary] [common-options]
                              [--secure] [--mode <mode>] [--tmpdir <directory>]
                              <template>

                              stat [common-options]
                              <file> [...]

  guestcontrol              <uuid|vmname> [--verbose|-v] [--quiet|-q]

                              list <all|sessions|processes|files> [common-opts]

                              closeprocess [common-options]
                              <   --session-id <ID>
                                | --session-name <name or pattern>
                              <PID1> [PID1 [...]]

                              closesession [common-options]
                              <  --all | --session-id <ID>
                                | --session-name <name or pattern> >

                              updatega|updateguestadditions|updateadditions
                              [--source <guest additions .ISO>]
                              [--wait-start] [common-options]
                              [-- [<argument1>] ... [<argumentN>]]

                              watch [common-options]

  metrics                   list [*|host|<vmname> [<metric_list>]]
                                                 (comma-separated)

  metrics                   setup
                            [--period <seconds>] (default: 1)
                            [--samples <count>] (default: 1)
                            [--list]
                            [*|host|<vmname> [<metric_list>]]

  metrics                   query [*|host|<vmname> [<metric_list>]]

  metrics                   enable
                            [--list]
                            [*|host|<vmname> [<metric_list>]]

  metrics                   disable
                            [--list]
                            [*|host|<vmname> [<metric_list>]]

  metrics                   collect
                            [--period <seconds>] (default: 1)
                            [--samples <count>] (default: 1)
                            [--list]
                            [--detach]
                            [*|host|<vmname> [<metric_list>]]

  natnetwork                add --netname <name>
                            --network <network>
                            [--enable|--disable]
                            [--dhcp on|off]
                            [--port-forward-4 <rule>]
                            [--loopback-4 <rule>]
                            [--ipv6 on|off]
                            [--port-forward-6 <rule>]
                            [--loopback-6 <rule>]

  natnetwork                remove --netname <name>

  natnetwork                modify --netname <name>
                            [--network <network>]
                            [--enable|--disable]
                            [--dhcp on|off]
                            [--port-forward-4 <rule>]
                            [--loopback-4 <rule>]
                            [--ipv6 on|off]
                            [--port-forward-6 <rule>]
                            [--loopback-6 <rule>]

  natnetwork                start --netname <name>

  natnetwork                stop --netname <name>

  natnetwork                list [<pattern>]

  hostonlyif                ipconfig <name>
                            [--dhcp |
                            --ip<ipv4> [--netmask<ipv4> (def: 255.255.255.0)] |
                            --ipv6<ipv6> [--netmasklengthv6<length> (def: 64)]]
                            create |
                            remove <name>

  dhcpserver                add|modify --netname <network_name> |
                                       --ifname <hostonly_if_name>
                            [--ip <ip_address>
                            --netmask <network_mask>
                            --lowerip <lower_ip>
                            --upperip <upper_ip>]
                            [--enable | --disable]

  dhcpserver                remove --netname <network_name> |
                                   --ifname <hostonly_if_name>

  usbdevsource              add <source name>
                            --backend <backend>
                            --address <address>
  usbdevsource              remove <source name>

 Introspection and guest debugging:
  VBoxManage debugvm <uuid|vmname> dumpvmcore [--filename=name]
  VBoxManage debugvm <uuid|vmname> info <item> [args...]
  VBoxManage debugvm <uuid|vmname> injectnmi
  VBoxManage debugvm <uuid|vmname> log [[--release] | [--debug]]
      [group-settings...]
  VBoxManage debugvm <uuid|vmname> logdest [[--release] | [--debug]]
      [destinations...]
  VBoxManage debugvm <uuid|vmname> logflags [[--release] | [--debug]] [flags...]
  VBoxManage debugvm <uuid|vmname> osdetect
  VBoxManage debugvm <uuid|vmname> osinfo
  VBoxManage debugvm <uuid|vmname> osdmesg [--lines=lines]
  VBoxManage debugvm <uuid|vmname> getregisters [--cpu=id] [reg-set.reg-name...]
  VBoxManage debugvm <uuid|vmname> setregisters [--cpu=id]
      [reg-set.reg-name=value...]
  VBoxManage debugvm <uuid|vmname> show [[--human-readable] | [--sh-export] |
      [--sh-eval] | [--cmd-set]] [settings-item...]
  VBoxManage debugvm <uuid|vmname> stack [--cpu=id]
  VBoxManage debugvm <uuid|vmname> statistics [--reset] [--descriptions]
      [--pattern=pattern]

 Extension package management:
  VBoxManage extpack install [--replace] <tarball>
  VBoxManage extpack uninstall [--force] <name>
  VBoxManage extpack cleanup
```
