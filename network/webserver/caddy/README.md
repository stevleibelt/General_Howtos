# Caddy Webserver

Caddy is a webserver that can be used as reverse proxy and comes with modern default values.

This helps you to keep your configuration file small and the overall settings well updated.

## Example Caddyfile

```bash
# The caddy lexer separates tokens by whitespace
# ref: https://caddyserver.com/docs/caddyfile/concepts
#bo: global options block
# Optional block is like highlander ... there can be only one
#  And it must be the first block in the whole file
{
    email artodeto@bazzline.net
}
#eo: global options block

#bo: environment variables
# You can use environment variables from the shell
# ref: https://caddyserver.com/docs/caddyfile-tutorial
{$MY_VARIABLE:default_argument}
#eo: environment variables

#bo: snippet blocks
(my_first_snippet) {
    #something reusable and useful
    respond "This is an example with argument {args.0} and {args.1}"
}
#eo: snippet blocks

#bo: site blocks
# Directives and matchers must go in a site block
#  There os no global scope or inheritance across site blocks
# If there is only one site block, the curly braces are optional
# A request matches the most specific address
# Arguments can be quoted ("abc def")
#  \" is supported as well as `{"foo": "bar"}`
#bazzline.net: address
# Addresses can be
#  localhost
#  example.com
#  :443
#  *.example.com
#  http://
# Address have to be uniq per Caddyfile
# Multiple addresses are possible
#    localhost:8080, example.com, www.example.com
#  same as
#    localhost:8080,
#    example.com,
#    www.example.com
bazzline.net {
    #bo: matcher definition
    # Matcher tokens can be omitted if you want to match all requests
    #  * is optional
    @post {
        method POST
    }
    #eo: matcher definition

    #reverse_proxy: directive
    #  ref: https://caddyserver.com/docs/caddyfile/directives/reverse_proxy
    #@post: matcher token
    #{localhost:9001 | localhost:9002 | first}: argument
    #lbfirst: subdirective
    # Directive order matters!
    #  ref: https://caddyserver.com/docs/caddyfile/directives#directive-order
    #  But order can be replace with a route block
    #    ref: https://caddyserver.com/docs/caddyfile/directives/route#utility
    reverse_proxy @post localhost:9001 localhost:9002 {
        lb_policy first
    }

    #file_server: directive
    #/static: matcher token
    file_server /static

    import my_first_snippet "Argument 1" "Argument 2"
}

www.bazzline.net {
    #redir: directive
    #https://bazzline.net{uri}: argument
    redir https://bazzline.net{uri}

    import my_first_snippet "Argument A" "Argument B"
}
#eo: site blocks
```

## Links

* [Official webpage](https://caddyserver.com/) - 20230213
  * [Logging](https://caddyserver.com/docs/caddyfile/directives/log) - 20230213
  * [Tutorial](https://caddyserver.com/docs/caddyfile-tutorial) - 20230316
  * [Concepts inside the Caddyfile](https://caddyserver.com/docs/caddyfile/concepts)

