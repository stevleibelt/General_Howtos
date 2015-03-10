# WARNING: You don't have \<path\>/.gem/ruby /\<version\>/bin in your PATH, ...

```
cd ~
cd .gem/ruby/<your version number>/bin
pwd
# save path
cd ~
# assuming you are using bash as shell
vim .bashrc
# add following two lines
PATH=$PATH:<path from your pwd print above>
export PATH
```
