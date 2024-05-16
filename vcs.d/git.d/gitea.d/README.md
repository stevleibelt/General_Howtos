# Gitea

## Installation on Debian 10 bullseye

Based on [this](https://www.howtoforge.com/how-to-install-gitea-git-service-on-debian-11/) and [that](https://docs.gitea.io/en-us/install-from-binary/) howto as well as on own notes.

```
#update system and install database
sudo apt update
sudo apt install git redis-server redis-tools mariadb-server -y

#setup database
sudo mysql_secure_installation
mysql -u root -p
CREATE DATABASE `gitea` DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;
CREATE USER `gitea`@'localhost' IDENTIFIED BY '<password>';
GRANT ALL PRIVILEGES ON `gitea`.* TO `gitea`@`localhost`;
FLUSH PRIVILEGES;
\q

#prepare system for gitea
sudo adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git

sudo mkdir -p /var/lib/gitea/{custom,data,log}
sudo chown -R git:git /var/lib/gitea/
sudo chmod -R 750 /var/lib/gitea/

sudo mkdir -p /etc/gitea
sudo chown -R git:git /etc/gitea/
sudo chmod -R 750 /etc/gitea/

sudo mkdir -p /var/log/gitea
sudo chown -R git:git /var/log/gitea/
sudo chmod -R 750 /var/log/gitea/

#install gitea
curl -s https://api.github.com/repos/go-gitea/gitea/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '\linux-amd64$' | wget -i -
wget "https://raw.githubusercontent.com/go-gitea/gitea/main/contrib/systemd/gitea.service"

gpg --keyserver keys.openpgp.org --recv 7C9E68152594688862D62AF62D9AE806EC1592E2
gpg --verify gitea-1.15.4-linux-amd64.asc gitea-1.15.4-linux-amd64

#based on your setup, open and adapt the service file
vim gitea.service

sudo mv gitea-*-linux-amd64 /usr/local/bin/gitea
sudo mv gitea.service /etc/systemd/system/gitea.service
sudo systemctl daemon-reload
sudo systemctl enable gitea.service

#setup application
sudo vim /etc/gitea/app.ini

#start it
sudo systemctl start gitea.service
```

# Migrate from host to host

```
#old host
sudo systemctl disable gitea.service
sudo systemctl stop gitea.service

mysqldump -u root -p gitea | gzip > gitea.sql.gz

sudo rsync -a /var/lib/gitea <username>@<hostname>:/var/lib/gitea
sudo scp /etc/gitea/app.ini <username>@<hostname>:/etc/gitea/
sudo rsync -a /home/git/.ssh <username>@<hostname>:/home/git/.ssh

#check if you have configured /etc/ssh/sshd_config with `AllowUsers`

#new host
sudo gunzip < gitea.sql.gz | mysql -u root -p gitea

sudo chown -R git:git /var/lib/gitea
sudo chmod -R 750 /var/lib/gitea

sudo chown -R git:git /etc/lgitea
sudo chmod -R 750 /etc/gitea

sudo chown -R git:git /var/log/gitea/
sudo chmod -R 750 /var/log/gitea/

sudo systemctl start gitea.service
```

# Customizing Gitea

[Official](https://docs.gitea.io/en-us/customizing-gitea/) page - 20211207

## Lables

```
cd /var/lib/gitea/custom
mkdir options
cat > options/label <<DELIM
#e11d21 1 urgent and important ; prio 0
#fbca04 2 urgent but not important ; prio 1
#f6c6c7 3 not urgent but important ; prio 2
#bfe5bf 4 not urgent and not important ; prio 3
#c7def8 by email
#bfd4f2 by phone
#ee0701 bug ; Something is not working
#cccccc duplicate ; This issue or pull request already exists
#84b6eb enhancement ; New feature
#128a0c help wanted ; Need some help
#e6e6e6 invalid ; Something is wrong
#cc317c question ; More information is needed
#ffffff wontfix ; This won't be fixed
DELIM
```

# Errors and how to solve them

### git...: Permission denied (publickey).

`git@<gitea host>: Permission denied (publickey).`

```
#check if home of user git is correct
getnet passwd | grep git

chown -R git:git /home/git
chmod -R 755 /home/git
```

# Links

* [Outdated but good for understanding - Gitea Debian/Ubuntu Packages](https://gitlab.com/packaging/gitea) - 20220111
