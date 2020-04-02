FROM jetty:9-jre8-alpine

LABEL authors="mark.cooper@lyrasis.org,jonathan.green@lyrasis.org"

ENV BLAZEGRAPH_NAME=bigdata \
    BLAZEGRAPH_RW_PATH=/RWStore.properties \
    BLAZEGRAPH_VERSION=CANDIDATE_2_1_5 \
    JAVA_OPTS="-Xmx1g" \
    JETTY_WEBAPPS=/var/lib/jetty/webapps \
    BLAZEGRAPH_UID=888 \
    BLAZEGRAPH_GID=888
ENV BLAZEGRAPH_VERSION_URL https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_RELEASE_${BLAZEGRAPH_VERSION}/blazegraph.war

ADD RWStore.properties $BLAZEGRAPH_RW_PATH
ADD entrypoint.sh /var/lib/jetty/entrypoint.sh

USER root

RUN apk add --no-cache openssl && \
    apk add --no-cache bash && \
    apk add --no-cache su-exec && \
    apk add --no-cache curl && \
    wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL && \ 
    chmod +x /var/lib/jetty/entrypoint.sh

WORKDIR /var/lib/jetty
CMD ./entrypoint.sh
