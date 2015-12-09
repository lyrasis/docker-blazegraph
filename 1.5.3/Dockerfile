FROM jetty:9-jre8

MAINTAINER mark.cooper@lyrasis.org

ENV JETTY_WEBAPPS /var/lib/jetty/webapps
ENV BLAZEGRAPH_NAME bigdata
ENV BLAZEGRAPH_RW_PATH /RWStore.properties
ENV BLAZEGRAPH_VERSION 1.5.3
ENV BLAZEGRAPH_VERSION_URL http://sourceforge.net/projects/bigdata/files/bigdata/${BLAZEGRAPH_VERSION}/bigdata.war/download

ADD RWStore.properties $BLAZEGRAPH_RW_PATH

RUN wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL
RUN chown jetty:jetty $BLAZEGRAPH_RW_PATH

CMD ["java","-Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/RWStore.properties","-jar","/usr/local/jetty/start.jar"]
