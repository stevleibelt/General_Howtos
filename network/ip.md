# Usage

## List all available information

```
ip a
```

## List address per device

```
ip addr list dev <device>
```

## add IP-Address

```
ip addr add 1.2.3.4/24 dev <device>
```

## Remove IP-Address

```
ip addr del 1.2.3.4/24 dev <device>
```

# Debugging

```
#execute as root
ip monitor
```
