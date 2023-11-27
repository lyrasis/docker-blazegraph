#!/bin/bash

# Create blazegraph user
addgroup -S -g $BLAZEGRAPH_GID blazegraph
adduser -S -s /bin/false -G blazegraph -u $BLAZEGRAPH_UID blazegraph

# Make sure permissions are good
chown -R blazegraph:blazegraph "$JETTY_BASE"
chown -R blazegraph:blazegraph "$TMPDIR"

su-exec blazegraph:blazegraph java $JAVA_OPTS -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/RWStore.properties -jar /usr/local/jetty/start.jar
