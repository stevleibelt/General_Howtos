# wget

## Examples

### Download into a directory

```bash
wget -P /my/path <string: url>
```

### Download with different file name

```bash
#if using -O, it is important to put it at the beginnen
#  else, it is not working
wget -O file.name "https://www.bazzline.net"

#or, long name
wget "https://www.bazzline.net" --output-document=bazzline_net.html
```

### Skip certificate validation

```bash
--no-check-certificate
```

### Download whole page

```bash
wget -np -r -k 'https://your.domain.org'
```

