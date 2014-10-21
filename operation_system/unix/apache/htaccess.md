# redirect to https

    <IfModule mod_rewrite.c>
    RewriteEngine on

    RewriteCond %{HTTPS} !=on
    RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
    </IfModule>
