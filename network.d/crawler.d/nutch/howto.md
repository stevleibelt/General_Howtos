# apache nutch

## work flow

* generate
* fetch
* parse
* update db

# set JAVA_HOME

```
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
```

# setup

* setup nutch
    * extract nutch
    * set NUTCH_RUNTIME_HOME that is is pointing to the nutch directory
    * customize crawl properties (at least provider name)
        * default configuration -> conf/nutch-default.xml
        * you place to overwrite -> conf/nutch-site.xml
    * set a seed list of urls to crawl (one url per line)
        * mkdir list_of_url
        * cd list_of_url
        * touch seed.txt
    * mkdir output directory path (e.g. mkdir data)
* setup solr
    * extract solr
    * set APACHE_SOLR_HOME that is pointing to this directory
        * APACHE_SOLR_HOME=$(pwd)
        * cp -r ${APACHE_SOLR_HOME}/server/solr/configsets/basic_configs ${APACHE_SOLR_HOME}/server/solr/configsets/nutch
        * cp ${NUTCH_RUNTIME_HOME}/conf/schema.xml ${APACHE_SOLR_HOME}/server/solr/configsets/nutch/conf
        * rm ${APACHE_SOLR_HOME}/server/solr/configsets/nutch/conf/managed-schema
    * start the solr server
        * ${APACHE_SOLR_HOME}/bin/solr start
    * ${APACHE_SOLR_HOME}/bin/solr create -c nutch -d ${APACHE_SOLR_HOME}/server/solr/configsets/nutch/conf/
    * add the core name to the solr server url: -Dsolr.server.url=http://localhost:8983/solr/nutch

# using it

## by doing each step on your own

```
#create db from the urls
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch inject data/crawldb list_of_url
#fetch list for all pages we need to crawl
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch generate data/crawldb data/segments
SEGMENT_ONE=$(ls -d data/segments/2* | tail -1)
#fetch the segment
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch fetch ${SEGMENT_ONE}
#parse the segment
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch parse ${SEGMENT_ONE}
#update database
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch updatedb data/crawldb ${SEGMENT_ONE}
#index them
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch invertlinks data/linkdb -dir data/segments

#indexing into solr
#@note: segments path needs to be determine for each run!
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch index -Dsolr.server.url=http://localhost:8983/solr/nutch ${NUTCH_RUNTIME_HOME}/data/crawldb/ -linkdb ${NUTCH_RUNTIME_HOME}/data/linkdb/ ${NUTCH_RUNTIME_HOME}/data/segments/20180130162214/ -filter -normalize -deleteGone
#delete duplicates
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch dedup -Dsolr.server.url=http://localhost:8983/solr/nutch ${NUTCH_RUNTIME_HOME}/data/crawldb/
#clean solr
${NUTCH_RUNTIME_HOME}/runtime/local/bin/nutch clean -Dsolr.server.url=http://localhost:8983/solr/nutch ${NUTCH_RUNTIME_HOME}/data/crawldb/
```

## with a shipped with bash script

```
${NUTCH_RUNTIME_HOME}/runtime/local/bin/crawl -i -D solr.server.url=http://localhost:8983/solr/nutch -s ${NUTCH_RUNTIME_HOME}/list_of_url/ ${NUTCH_RUNTIME_HOME}/data 100
```

## and all in one bash script

Just use it as a base.

```
#!/bin/bash

##begin of dependencies
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

APACHE_SOLR_HOME="<insert your path>"
NAME=${1}
NUTCH_NUMBER_OF_RUNS=100
NUTCH_RUNTIME_HOME="<insert your path>"
##end of dependencies

##begin of business logic
##begin of setup solr
if [[ ! -d "${APACHE_SOLR_HOME}/server/solr/configsets/nutch_${NAME}" ]];
then
    echo ":: No solr core found for ${NAME}."
    echo "   Creating one ..."

    cp -r ${APACHE_SOLR_HOME}/server/solr/configsets/basic_configs ${APACHE_SOLR_HOME}/server/solr/configsets/nutch_${NAME}
    cp ${NUTCH_RUNTIME_HOME}/conf/schema.xml ${APACHE_SOLR_HOME}/server/solr/configsets/nutch_${NAME}/conf
    rm ${APACHE_SOLR_HOME}/server/solr/configsets/nutch_${NAME}/conf/managed-schema
    ${APACHE_SOLR_HOME}/bin/solr create -c nutch_${NAME} -d ${APACHE_SOLR_HOME}/server/solr/configsets/nutch_${NAME}/conf/

    echo "   Done ..."
fi
##end of setup solr

##begin of starting nutch
echo ":: Starting nutch with ${NUTCH_NUMBER_OF_RUNS} runs."
${NUTCH_RUNTIME_HOME}/runtime/local/bin/crawl -i -D solr.server.url=http://localhost:8983/solr/nutch_${NAME} -s ${NUTCH_RUNTIME_HOME}/list_of_url/${NAME} ${NUTCH_RUNTIME_HOME}/data/${NAME} ${NUTCH_NUMBER_OF_RUNS}
echo "   Done ..."
##end of starting nutch
##end of business logic
```

# filter urls

* use "conf/regx-urlfilter.txt"
* https://stackoverflow.com/questions/37353277/apache-nutch-crawler-keeps-retrieve-only-single-url

# links

* https://wiki.apache.org/nutch/NutchTutorial
* https://wiki.apache.org/nutch/NutchTutorial#Setup_Solr_for_search
    * https://lucene.apache.org/solr/
    * https://wiki.apache.org/solr/SolrQuerySyntax
* https://wiki.apache.org/nutch/bin/nutch%20clean
* https://wiki.apache.org/nutch/bin/nutch%20dedup
* https://wiki.apache.org/nutch/Nutch_1.X_RESTAPI
* https://issues.apache.org/jira/browse/NUTCH-2507
* http://digitalpebble.blogspot.de/2013/09/nutch-fight-17-vs-221.html
* https://digitalpebble.blogspot.de/2017/01/the-battle-of-crawlers-apache-nutch-vs.html
* http://soryy.com/blog/2014/ajax-javascript-enabled-parsing-apache-nutch-selenium/
* https://wiki.apache.org/nutch/AdvancedAjaxInteraction
