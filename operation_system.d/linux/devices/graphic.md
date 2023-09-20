# get your card

```
sudo lspci -vnn | grep VGA -A 12
```

# check if opengl is using your drivers

```
glxinfo | grep OpenGl
```
