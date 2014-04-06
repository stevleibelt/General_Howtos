# create first couchdb and mark /var/lib/couchdb as data volume

    COUCH1=$(sudo docker run -d -p 5984 -v /var/lib/couchdb shykes/couchdb:2013-05-03)

# add data to first database

    HOST=localhost
    URL="http://$HOST:$(sudo docker port $COUCH1 5984 | grep -Po '\d+$')/_utils/"
    echo "Navigate to $URL in your browser, and use the couch interface to add data"

# create second couchdb

    COUCH2=$(sudo docker run -d -p 5984 --volumes-from $COUCH1 shykes/couchdb:2013-05-03)

# browse data on second couch

    HOST=localhost
    URL="http://$HOST:$(sudo docker port $COUCH2 5984 | grep -Po '\d+$')/_utils/"
    echo "Navigate to $URL in your browser. You should see the same data as in the first database"'!'

# clean up

    docker stop $COUCH1
    docker stop $COUCH2
    docker rm $COUCH1
    docker rm $COUCH2
