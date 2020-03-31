FROM jetty:9-jre8

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

RUN DEPENDENCIES="openssl \
    curl \ 
    openssl" && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --no-install-recommends $DEPENDENCIES && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    # From https://gist.github.com/dmrub/b311d36492f230887ab0743b3af7309b
    # Install latest su-exec
    set -ex; \
     \
     curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c; \
     \
     fetch_deps='gcc libc-dev'; \
     apt-get update; \
     apt-get install -y --no-install-recommends $fetch_deps; \
     rm -rf /var/lib/apt/lists/*; \
     gcc -Wall \
         /usr/local/bin/su-exec.c -o/usr/local/bin/su-exec; \
     chown root:root /usr/local/bin/su-exec; \
     chmod 0755 /usr/local/bin/su-exec; \
     rm /usr/local/bin/su-exec.c; \
     \
     apt-get purge -y --auto-remove $fetch_deps
    wget -O ${JETTY_WEBAPPS}/${BLAZEGRAPH_NAME}.war $BLAZEGRAPH_VERSION_URL && \ 
    chmod +x /var/lib/jetty/entrypoint.sh

WORKDIR /var/lib/jetty
CMD ./entrypoint.sh
