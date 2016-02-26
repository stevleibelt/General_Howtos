# general

Everything is tested with version 4.0.

# debug vcl

Enrich your "my.vcl" file with the following.

```
import std:

#you are now able to log to varnish log by using
std.log("my_prefix: my message");
#get the request url like "/foo/bar.css"
std.log(req.url);
```

After reloading and restarting the varnish, you can use the varnish logl

```
varnishlog | grep 'my_prefix:'
```

# vcl with multiple (apache) backends

The following vcl file is not the "last word configuration files". It works if the varnish and all apache vhosts are on the same machine.

```
#imported for debugging
import std;

# define default server
backend default {
    .host = "my.default.host.com";
    .port = "80";
    .probe = {
        .url = "/test";
        .timeout = 3s;
        .interval = 5s;
        .window = 5;
        .threshold = 3;
    }
}

# define backen 01 server
backend backen_01 {
    .host = "my.backend01.host.com";
    .port = "80";
    .probe = {
        .url = "/test";
        .timeout = 3s;
        .interval = 5s;
        .window = 5;
        .threshold = 3;
    }
}

# define backen 02 server
backend backen_02 {
    .host = "my.backend02.host.com";
    .port = "80";
    .probe = {
        .url = "/test";
        .timeout = 3s;
        .interval = 5s;
        .window = 5;
        .threshold = 3;
    }
}

# decide which server to take and clean up request
sub vcl_recv {
    #enable below for debugging
    #std.log(req.http.host);
    if (req.http.host ~ "(?i)my.backen01.host.com") {
        set req.http.host = "my.backend01.host.com";
        set req.backend_hint = backend_01;
        #enable below for debugging
        #std.log("sl:: backend hint was set to backend 01");
    } elseif (req.http.host ~ "(?i)my.backend02.host.com") {
        set req.http.host = "my.backend02.host.com";
        set req.backend_hint = backend_02;
        #enable below for debugging
        #std.log("sl:: backend hint was set to backend 02");
    }
    #enable below for debugging
    #std.log(server.hostname);
}
```

# links 

* https://www.varnish-cache.org/docs/4.0/
* https://www.varnish-cache.org/docs/4.0/glossary/index.html
* https://www.varnish-cache.org/docs/4.0/reference/vcl.html
* https://www.varnish-cache.org/docs/4.0/users-guide/vcl-backends.html
* http://book.varnish-software.com/4.0/chapters/VCL_Basics.html
* https://www.varnish-cache.org/docs/4.0/reference/vmod_std.generated.html?#func-log
* http://www.jeffgeerling.com/blogs/jeff-geerling/debugging-varnish-vcl
