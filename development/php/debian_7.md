# build readline

```
mkdir -p /tmp/build_php_readline
cd /tmp/build_php_readline
sudo apt-get install libreadline-dev -y
apt-get install php5-dev -y
sudo apt-get source php5
cd php5-5.4.41/ext/readline/
