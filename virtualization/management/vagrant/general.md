# box

## install a box

```
#base arch linux box
vagrant init terrywang/archlinux; vagrant up --provider virtualbox
#a lamp centos box
vagrant init smallhadroncollider/centos-6.5-lamp; vagrant up --provider virtualbox
```

## commands 

| command | description |
| --- | --- |
| vagrant box list | lists locally fetched images |
| vagrant box outdated | check is current Vagrant file contains an outdated image |
| vagrant box update | updates current Vagrant file to latest image |
| vagrant destroy [name|id] | stops and removes anything connected to this running machine |
| vagrant global-status | lists stats of all active machines |
| vagrant halt [name|id] | shuts down running machine |
| vagrant init [name[url]] | creates a Vagrant file in the current path |
| vagrant plugin expunge [--force] [--reinstall] [...] | removes all users installed plugins |
| vagrant plugin install <name|path> | installs a plugin |
| vagrant plugin list | list installed plugins |
| vagrant plugin repair | tries to repair the plugins.json |
| vagrant plugin uninstall <name> | removes plugins |
| vagrant plugin update [<name>] | updates plugins |
| vagrant port [<name>] | lists all mapped guest ports |
| vagrant powershell | tries to open a powershell environment if guest supports it |
| vagrant provision [<name>] | executes configured provisioners |
| vagrant rdp | tries to start a rdp session if guest supports it |
| vagrant reload | runs halt followed by an up |
| vagrant resume [<name|id|>] |  wakes up a previously suspended machine |
| vagrant snapshot [push|pop|save|restore|list|delete] | handles [snapshoting](https://www.vagrantup.com/docs/cli/snapshot.html) of a machine | 
| vagrant ssh [<name|id>] | ssh into machine |
| vagrant ssh-config [<name|id>] | outputs valid ssh configuration to use external tool |
| vagrant status [<name|id>] | outputs state of vagrant maschines |
| vagrant suspend [<name|id>] | puts a machine into sleep |
| vagrant up [<name|id>] | creates and configures a maching according the vagrant file |
| vagrant upload source [destination] [<name|id>] | uploads files and directories to a machine |
| vagrant validate | validates a Vagrant file |

```
#commands that can be done anywhere
#list locally fetched images
vagrant box list

#commands that can be done in a path containing a Vagrant file
#list outdated images
vagrant box outdated
#update image
vagrant box update
```

# Vagrantfile

## List of usefull configuration settings

| configuration setting | description |
| --- | --- |
| config.vm.hostname | sets static host name |
| config.vm.network | configures [network](https://www.vagrantup.com/docs/networking/) |
| config.vm.synced_folder "host/path" "/machine/path" | configures a [share folder](https://www.vagrantup.com/docs/synced-folders/) |

## Multiple Machine Setup

```
Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: "echo Hello"

    config.vm.define "web", primary: true do |web|
        web.vm.box = "apache"
    end

    config.vm.define "db" do |db|
        db.vm.box = "mysql"
    end
end
```

# Use ansible as provisioner

```
#add the following lines to the Vagrantfile
config.vm.provision "ansible" do |ansible|
    ansible.playbook = "my_playbook.yml"
end
```

# List of possible useful plugins

| plugin | description |
| --- | --- |
| vagrant-vsphere | [source](https://github.com/nsidc/vagrant-vsphere/) and [howto](https://dor.ky/using-vmware-vsphereesxi-as-a-provider-for-vagrant/) (from 2014-10-11) |
| vagrant-proxyconf | [source](https://tmatilai.github.io/vagrant-proxyconf/)
| vagrant-guest_ansible | [source](https://github.com/vovimayhem/vagrant-guest_ansible) |

# links

* [Vagrantfile Tips and Tricks](https://www.vagrantup.com/docs/vagrantfile/tips.html) - 2020-02-11
* [Vagrantfile machine config settings](https://www.vagrantup.com/docs/vagrantfile/machine_settings.html) - 2020-02-11
* [docs](https://docs.vagrantup.com/v2/getting-started)
* [official boxes archive](https://vagrantcloud.com/)
* [list of base boxes](http://vagrantbox.es/)
* [list of base boxes](https://github.com/opscode/bento)
* [arch linux wiki page](https://wiki.archlinux.org/index.php/Vagrant)
* [more boxes](https://www.vagrantup.com/docs/virtualbox/boxes.html)
* [search for boxes](https://app.vagrantup.com/boxes/search)
