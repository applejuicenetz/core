FROM docker.io/library/eclipse-temurin:21-jre-noble

ARG TARGETARCH DOWNLOAD_URL

ENV PUID=1000 \
    PGID=1000 \
    CORE_PORT=9850 \
    XML_PORT=9851 \
    HOME="/config"

ADD ${DOWNLOAD_URL} /ajcore.jar

RUN apt update && \
    apt install -y curl sudo && \
    apt clean && \
    chmod +r /ajcore.jar && \
    mkdir -p /config && \
    chmod 777 /config

COPY rootfs/ /

EXPOSE ${CORE_PORT} ${XML_PORT}

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://127.0.0.1:${XML_PORT} || exit 1

ENTRYPOINT ["/init"]

CMD ["/opt/java/openjdk/bin/java", "-Duser.home=/config", "-XX:MaxRAMPercentage=95.0", "-jar", "/ajcore.jar"]

SHELL ["/bin/bash"]
