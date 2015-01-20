# enable

    echo 'xdebug.remote_enable=ON\nxdebug.remote_host="<the ip address of the client>"' >> /etc/php/conf.d/xdebug.ini

# as a shell script

    #!/bin/bash
    XDEBUG_CONFIG="idekey=netbeans-xdebug" phpunit -dxdebug.remote_autostart=1 -dxdebug.remote_connect_back=1 -dxdebug.remote_enable=1 -dxdebug.remote_mode=req $*

# links

* http://xdebug.org/docs/remote
* http://blog.rajatpandit.com/2010/04/30/xdebug-remote-debugging/
* http://blog.rajatpandit.com/2010/04/30/xdebug-installation-and-customization/
