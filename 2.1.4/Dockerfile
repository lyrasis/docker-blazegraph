FROM jetty:9.4.2-jre8-alpine

LABEL authors="mark.cooper@lyrasis.org,kevin@enchartus.ca"

ENV JETTY_WEBAPPS /var/lib/jetty/webapps
ENV BLAZEGRAPH_NAME bigdata
ENV BLAZEGRAPH_RW_PATH /RWStore.properties
ENV BLAZEGRAPH_VERSION 2_1_4
ENV BLAZEGRAPH_VERSION_URL https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_${BLAZEGRAPH_VERSION}/blazegraph.war

ADD RWStore.properties $BLAZEGRAPH_RW_PATH

RUN apk --no-cache add openssl

RUN wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL
RUN chown jetty:jetty $BLAZEGRAPH_RW_PATH

RUN chgrp -R 0 /var/lib/jetty && \
    chmod -R g=u /var/lib/jetty

USER jetty
CMD cd /var/lib/jetty && java -jar /usr/local/jetty/start.jar -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/RWStore.properties
