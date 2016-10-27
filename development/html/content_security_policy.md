# csp - content security policy

## general

* a policy evaluated and used in the client (browser)
* created to solve the xss issues finally (reduce the attack vector)
* modern webbrowser supporting this, older ones simple download everything

## available rules

| rule name | applies to | description | 
| --- | --- | --- |
| script-src | <script> |  contains a list of domains where external scripts are allowed to download from |
| object-src | <object>, <embed>, <applet> | contains a list of domains where external plugins (flash, silverlight etc.) are allowed to download from | 
| style-src | <link rel="stylesheet" ... > | contains a list of domains where external styles are allowed to download from | 
| img-src | <img> | contains a list of domains where external images are allowed to download from | 
| media-src | <video>, <audio> | contains a list of domains where external media are allowed to download from | 
| frame-src | <frame>, <iframe> | contains a list of domains where frames are allowed to download from | 
| font-src | @front-face | contains a list of domains where external fonts are allowed to download from | 
| connect-src | WebSocket, XHR | contains a list of domains where external connections are allowed to download from | 
| default-src | - | contains the default source where resources ere allowed to download from | 

## how to send the rules?

* you have to send a dedicated http header
* sadly but true, the browser vendors did not made it to react on the same header

```php
$cspRules                           = 'script-src \'self\' cdnjs.cloudflare.com; style-src \'self\'';
$listOfBrowserNameToCspHeaderName   = [
    'chrome'            => 'X-WebKit-CSP',  //deprecated 
    'internet_explorer' => 'X-Content-Security-Policy',
    'modern_browsers'   => 'Content-Security-Policy'
];

foreach ($listOfBrowserNameToCspHeaderName as $cspHeaderName) {
    header($cspHeaderName . ': ' . $cspRules);
}
```

## example csp rules

```
#all resources are allowed to download from the current domain and cdn.bazzline.net
#scripts are allowed to download from the current domain and cdnjs.bazzline.net
#   inline javascript is not allowed
#stylesheets are allowed to download from the current domain and cdnstatic.bazzline.net
#   inline stylesheet is not allowed
default-src 'self' cdn.bazzline.net; script-src 'self' cdnjs.bazzline.net; style-src 'self' cdnstatic.bazzline.net
```

```
#scripts are allowed to download from the current domain
#   inline script and using eval is allowed
script-src 'self' 'unsafe-inline' 'unsafe-eval'
```

```
#all resources are allowed to download from the current domain and any secured (https) subdomain of bazzline.net
#frame and objects are forbidden
default-src 'self' https://*.bazzline.net; frame-src 'none'; object-src 'none'
```

```
#enables reporting uri to use https://reporting.bazzline.net/csp for that
reporting-uri: https://reporting.bazzline.net/csp
```

# links

* https://en.wikipedia.org/wiki/Content_Security_Policy
* https://www.w3.org/TR/CSP/
* https://support.cloudflare.com/hc/en-us/articles/216537517-What-is-Content-Security-Policy-CSP-and-how-can-I-use-it-with-CloudFlare-
* https://de.wikipedia.org/wiki/Content_Security_Policy
* https://d-mueller.de/blog/content-security-policy-tutorial/
