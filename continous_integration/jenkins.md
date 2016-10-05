# ease up reading private repositories (e.g. at bitbucket)

```
touch ${HOME}/.composer/auth.json
cat > ${HOME}/.composer/auth.json <<DELIM
{
    "bitbucket-oauth": {
        "bitbucket.org": {
            "consumer-key": "<consumer key>",
            "consumer-secret": "<secret key>"
        }
    }
}
DELIM
```

# links

* https://getcomposer.org/doc/articles/http-basic-authentication.md
