FROM jetty:9-jre8-alpine

LABEL authors="mark.cooper@lyrasis.org,kevin@enchartus.ca"

ENV BLAZEGRAPH_NAME=bigdata \
    BLAZEGRAPH_RW_PATH=/RWStore.properties \
    BLAZEGRAPH_VERSION=CANDIDATE_2_1_5 \
    JAVA_OPTS="-Xmx1g" \
    JETTY_WEBAPPS=/var/lib/jetty/webapps
ENV BLAZEGRAPH_VERSION_URL https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_${BLAZEGRAPH_VERSION}/blazegraph.war

ADD RWStore.properties $BLAZEGRAPH_RW_PATH

USER root
RUN apk --no-cache add openssl

# These are based on recommendations from the OpenShift docs in
# https://docs.openshift.org/latest/creating_images/guidelines.html#use-uid
# because of its use of random uids.
RUN wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL && \
    chown jetty:jetty $BLAZEGRAPH_RW_PATH && \
    chgrp -R 0 /var/lib/jetty && \
    chmod -R g=u /var/lib/jetty


# We must not run as root, because of OpenShift policy
USER jetty

# We have to make sure we run in the correct folder, since that might be messed
# up because of OpenShift's random uids (see the link above for more info).
# The blazegraph docs also hint about wrong startup folder being a possible
# problem if rules.log is not found:
# https://wiki.blazegraph.com/wiki/index.php/NanoSparqlServer#Common_Startup_Problems
WORKDIR /var/lib/jetty
CMD java $JAVA_OPTS -jar /usr/local/jetty/start.jar -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/RWStore.properties
