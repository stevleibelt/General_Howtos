# JDownloader 2

[JDownloader 2](https://jdownloader.org/) is a total legal and pretty valueable software.

You can use it to easily download things.

Please donate to this project to keep it alive.

## Example docker compose configuration

```bash
mkdir -p ~/.local/opt/docker/jdownloader2
cd ~/.local/opt/docker/jdownloader2
mkdir config

# adapt if needed

DOWNLOAD_PATH="${HOME}/Downloads"
HOST_PORT=15800

cat > compose.yml <<DELIM
services:
  jdownloader2:
    image: jlesage/jdownloader-2:latest
    ports:
      - ${HOST_PORT}:5800
    volumes:
      - ./config:/config:rw
      - "${DOWNLOAD_PATH}":/output:rw
DELIM

docker compose up -d
echo "open http://127.0.0.1:15800"
```
