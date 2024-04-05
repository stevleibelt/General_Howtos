# Graphiccard

# Get your card

```bash
sudo lspci -vnn | grep VGA -A 12
```

## Check if opengl is using your drivers

```bash
glxinfo | grep OpenGl
```
