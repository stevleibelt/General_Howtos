# redirect to https

## take from [stackoverflow](https://stackoverflow.com/questions/13666850/htaccess-http-to-https-redirect)

    <IfModule mod_rewrite.c>
    RewriteEngine on

    RewriteCond %{SERVER_PORT} !443
    RewriteRule ^(.*)$ https://%{HTTP_HOST}/$1 [R,L]
    </IfModule>
