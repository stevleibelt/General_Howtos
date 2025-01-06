# storm crawler

## core features

* scalable
* resilient
* low latancy
* easy to extend
* polite yet efficent

## configuration

The following file contains all available values:
core/src/main/resources/crawler-default.yaml

Custom configuration can be passed by adding "-conf <path to the file>" to the command line call.
Custom configuration values will override the default ones.
You can use "-conf" multiple times to use a "general" and a "environment specific" configuraton.

## building

### kickstart

```
#install apache storm on your system

#answer all questions
#   groupId: com.your-company.crawler
#   artefactId: stormcrawler
#   version: 1.2.3
#   package name: my_crawler
mvn archetype:generate -DarchetypeGroupId=com.digitalpebble.stormcrawler -DarchetypeArtifactId=storm-crawler-archetype -DarchetypeVersion=1.7
#cd <artefactId>
#less README.d
#storm nimbus &
#storm supervisor &
#storm ui &
mvn clean package
storm jar target/<artefactId>-<version>.jar <package name>.CrawlTopology -conf crawler-conf.yaml -local
```

### with elastic search

```
#you need at least apache storm 1.1.0
#@see
#   https://github.com/apache/storm
#   https://github.com/fhussonnois/docker-storm
#docker-compose -p storm -f ./docker-zookeeper.yml up -d
#docker-compose -p storm -f ./docker-storm.yml up -d
#
#checkout https://github.com/DigitalPebble/storm-crawler/tree/master/external/elasticsearch
cp -r kibana es-conf.yaml es-crawler.flux ES_IndexInit.sh es-injector.flux <your path where you have created the archetype>
rm crawler.flux
#touch seeds.txt, one line is one url
#needed in es-injector.flux
#add following to the pom.xml
        <dependency>
            <groupId>com.digitalpebble.stormcrawler</groupId>
            <artifactId>storm-crawler-elasticsearch</artifactId>
            <version>1.7</version>
        </dependency>
mvn clean package

#create index on elastic search
#change es-crawler.flux if you want to use your own index
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' -H 'Content-Type: application/json' -H 'kbn-version: 6.1.0'  -d '{"attributes":{"title":"status","timeFieldName":"@timestamp"}}'
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' -H 'Content-Type: application/json' -H 'kbn-version: 6.1.0'  -d '{"attributes":{"title":"metrics","timeFieldName":"@timestamp"}}'
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' -H 'Content-Type: application/json' -H 'kbn-version: 6.1.0'  -d '{"attributes":{"title":"index","timeFieldName":"@timestamp"}}'

#take the following line as a template
cat README.md | grep FLUX
storm jar target/<artefactId>-<version>.jar  org.apache.storm.flux.Flux --local es-injector.flux --sleep 86400
```

### the long road

```
git clone https://github.com/DigitalPebble/storm-crawler
cd storm-crawler
#adapt the configuration
mvn clean package
storm jar path/to/allmycode.jar org.me.MyCrawlTopology -conf my-crawler-conf.yaml -local"
```

# terms

* nimbus: started by the master node. takes care of distributing code, cluster management and monitoring
* worker node: starts a supervisor that executes a topology of as many worker processes as needed
* zookeeper: takes care of the states and the communication between nimbus and worker nodes
* topology: "a graph of computation" containing the logic how data is processed by what (see it as a processing pipe with if's) - a network of spouts and bolts
* stream: core abstraction of an unbounded sequence of tuples
* spout: source of streams
* bolt: consumes one input stream, does something with the data and emits a new stream

# link

* [main page](http://stormcrawler.net/)
    * [howto](https://storm.apache.org/releases/current/Tutorial.html)
    * [concept](https://storm.apache.org/releases/current/Concepts.html)
    * [example configuration](https://github.com/DigitalPebble/storm-crawler/wiki/Configuration)
    * [download of version 1.7](https://github.com/DigitalPebble/storm-crawler/releases/tag/1.7)
    * [list of external available modules for storing and fetching data](https://github.com/DigitalPebble/storm-crawler/tree/master/external)
* [list of storm examples](https://github.com/apache/storm/tree/master/examples)
    * [storm-crawler wiki](https://github.com/DigitalPebble/storm-crawler/wiki)
* [what is apache storm](http://storm.apache.org/releases/current/index.html)
