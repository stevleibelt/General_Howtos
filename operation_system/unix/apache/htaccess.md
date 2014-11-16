# redirect to https

    <IfModule mod_rewrite.c>
    RewriteEngine on

    RewriteCond !{HTTPS} off
    RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
    #if you want to add the www before
    #RewriteRule ^(.*)$ https://www.%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
    </IfModule>
