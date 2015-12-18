# .htacces

First rule of all, enable mod_rewrite in your configuration.

## .htpasswd

    # add to .htaccess
    # @see: http://weavervsworld.com/docs/other/passprotect.html
    #       http://stackoverflow.com/questions/6111627/how-to-use-a-relative-path-with-authuserfile-in-htaccess
    AuthUserFile <absolut path to >/.htpasswd
    AuthType Basic
    AuthName "<description>"
    Require valid-user

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

```
#Simple example
ErrorLogFormat "[%t] [%l] [pid %P] %F: %E: [client %a] %M"
```

# envvars

## want to [change the umask for apache](http://serverfault.com/questions/383734/how-do-i-set-default-umask-in-apache-on-debian)?

add, for example, "umask 002" at the end of the file "/etc/apache2/envars".

## font files like woff, woff2, ttf or eot are not interpreted in the browser

add following lines in your .htaccess or host configuration

```
AddType  application/font-woff  .woff
AddType  application/font-woff2  .woff2
AddType  application/font-ttf  .ttf
AddType  application/font-eot  .eot
```

# links

* http://whoopis.com/howtos/apache-rewrite.html
* http://www.addedbytes.com/articles/for-beginners/url-rewriting-for-beginners/
* http://www.askapache.com/htaccess/modrewrite-tips-tricks.html
* http://www.askapache.com/htaccess/mod_rewrite-variables-cheatsheet.html
* http://www.askapache.com/htaccess/crazy-advanced-mod_rewrite-tutorial.html
* http://perishablepress.com/stupid-htaccess-tricks/
