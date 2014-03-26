# .htacces

## redirect http content to https

    RewriteEngine On
    RewriteCond   %{SERVER_PORT}  !^443$
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

# links

* http://whoopis.com/howtos/apache-rewrite.html
