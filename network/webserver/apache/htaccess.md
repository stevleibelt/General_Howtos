# redirect

```htaccess
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{HTTP_HOST} ^<old domain> [OR] #You can combine multiple RewriteCond by using [OR]
    RewriteCond %{HTTP_HOST} ^<www.old domain>
    RewriteRule (.*)$ <new domain>$1 [R=301,L]
</IfModule>
```

# redirect to https

## take from [stackoverflow](https://stackoverflow.com/questions/13666850/htaccess-http-to-https-redirect)

```htaccess
<IfModule mod_rewrite.c>
    RewriteEngine on

    RewriteCond %{SERVER_PORT} !443
    RewriteRule ^(.*)$ https://%{HTTP_HOST}/$1 [R,L]
</IfModule>
```

# links

* https://github.com/phanan/htaccess
* https://httpd.apache.org/docs/current/mod/mod_rewrite.html
