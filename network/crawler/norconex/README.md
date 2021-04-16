# usage

```
#check configuration
bash collector-http.sh -k -c <path to the xml configuration>

#start
bash collector-http.sh -a start -c <path to the xml configuration>
```

# install other commiter

## core commiter

```
wget "https://oss.sonatype.org/content/repositories/releases/com/norconex/collectors/norconex-committer-core/2.1.2/norconex-committer-core-2.1.2.zip"
unzip norconex-committer-core-2.1.2.zip


```

## elastic search

```
wget "https://oss.sonatype.org/content/repositories/releases/com/norconex/collectors/norconex-committer-elasticsearch/4.1.0/norconex-committer-elasticsearch-4.1.0.zip"
unzip norconex-committer-elasticsearch-4.1.0.zip

#you have to provide the path to the norconex-collector-http/lib
bash norconex-committer-elasticsearch-4.1.0/install.sh
```

# terms

* collector: collecting data
* importer: parse and extract content from data
* commiter: store collected data to a preferred location

# link

* [the http collector](http://www.norconex.com/collectors/collector-http)
    * [process flow diagramm](https://www.norconex.com/collectors/collector-http/flow)
    * [howto](http://www.norconex.com/collectors/collector-http/getting-started)
    * [faq](https://www.norconex.com/collectors/collector-http/faq)
    * [phantomjs document fetcher](https://www.norconex.com/collectors/collector-http/latest/apidocs/com/norconex/collector/http/fetch/impl/PhantomJSDocumentFetcher.html)
    * [configuration section](http://www.norconex.com/collectors/collector-http/configuration)
        * [sorl example](https://github.com/Norconex/collector-http/issues/41)
* [the commiters](https://www.norconex.com/collectors/committers)
    * [sorl](https://www.norconex.com/collectors/committer-solr/)
    * [elastic search](https://www.norconex.com/collectors/committer-elasticsearch/)
    * [sql](https://www.norconex.com/collectors/committer-sql/)
* [the importers](http://www.norconex.com/collectors/importer/
    * [howto](http://www.norconex.com/collectors/importer/getting-started)
    * [available formats](http://www.norconex.com/collectors/importer/formats)
* [norconex on github](https://github.com/Norconex)
