# enable for php storm - simple put following in the console

```
export XDEBUG_CONFIG="idekey=PhpStorm remote_host=<your remote host ip> remote_enable=1 remote_port=9000 remote_request=req"
#or?
export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=<your remote host ip> remote_connect_back=0"
```
