# .htacces

## redirect http content to https

    RewriteEngine On
    RewriteCond   %{SERVER_PORT}  !^443$
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

# links

* http://whoopis.com/howtos/apache-rewrite.html
* http://www.askapache.com/htaccess/modrewrite-tips-tricks.html
* http://www.askapache.com/htaccess/mod_rewrite-variables-cheatsheet.html
* http://www.askapache.com/htaccess/crazy-advanced-mod_rewrite-tutorial.html
