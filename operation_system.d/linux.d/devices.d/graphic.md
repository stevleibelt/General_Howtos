# Graphiccard

# Get your card

```bash
lspci -k | grep -A 3 -E "(VGA|3D)"
# if you want to know more
lspci -vnn | grep VGA -A 12
```

## Check if opengl is using your drivers

```bash
glxinfo | grep OpenGl
```
