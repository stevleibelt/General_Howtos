# enable installation of not verified (without signature) extensions

```
about:config
xpinstall.signatures.required false
```

# htop/nmon/vmstat for firefox

```
about:performance
about:memory
about:debugging#addons
```

# always start in private mode

```
about:config
browser.privatebrowsingautostart true
```

# remove disk caching

```
about:config
browser.cache.disk.enable false
browser.cache.disk.enable true
#optional
browser.cache.memory.capacity <int> #value in kb, 4194304 KB is 4 GB
```

# misc

```
about:config
#disable pocket
browser.cache.memory.enable false
```

# add-ons

* [quick locale switcher](https://addons.mozilla.org/en-US/firefox/addon/quick-locale-switcher/)

# links

* http://www.pro-linux.de/news/1/23178/mozilla-verschiebt-erneut-die-signaturpflicht-fuer-add-ons.html
