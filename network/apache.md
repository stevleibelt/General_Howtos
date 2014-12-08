# .htacces

First rule of all, enable mod_rewrite in your configuration.

## redirect http content to https

    RewriteEngine On
    RewriteCond   %{SERVER_PORT}  !^443$
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

## list of flas (whoot?)

* C     -   chained with following rule
* CO=cookie     -   set specified cookie
* E=var:value   -   environment
* F     -   forbidden (403 header)
* G     -   gone (no longer available)
* H=handler     -   handle (set handler)
* L     -   last rule if this rule is used
* N     -   next (continue processing rule)
* NC    -   non case sensitive
* NE    -   not escape special url characters in output
* NS    -   not (if) subrequest (ignore rule if subrequest)
* P     -   proxy
* PT    -   pass through
* R     -   redirect (temporary)
* R=301 -   permanent redirect
* QSA   -   query string append from reqest to subsituted url
* S=x   -   skip next x rules
* T=mime-type   -   force mime-type

## error log format

Take a look into the [directive](https://httpd.apache.org/docs/current/mod/core.html#errorlogformat) section.

    #Simple example
    ErrorLogFormat "[%t] [%l] [pid %P] %F: %E: [client %a] %M"

# links

* http://whoopis.com/howtos/apache-rewrite.html
* http://www.addedbytes.com/articles/for-beginners/url-rewriting-for-beginners/
* http://www.askapache.com/htaccess/modrewrite-tips-tricks.html
* http://www.askapache.com/htaccess/mod_rewrite-variables-cheatsheet.html
* http://www.askapache.com/htaccess/crazy-advanced-mod_rewrite-tutorial.html
* http://perishablepress.com/stupid-htaccess-tricks/
