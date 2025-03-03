FROM eclipse-temurin:17-jre-noble

ARG TARGETARCH VERSION

ENV PUID=1000 \
    PGID=1000 \
    CORE_PORT=9850 \
    XML_PORT=9851 \
    HOME="/config"

ADD https://github.com/applejuicenetz/ajnetmask/releases/download/1.0.0/libajnetmask-${TARGETARCH}.so /usr/lib/libajnetmask.so
ADD https://github.com/applejuicenetz/core/releases/download/${VERSION}/ajcore.jar /ajcore.jar

RUN apt update && \
    apt install -y curl sudo && \
    apt clean && \
    chmod +r /usr/lib/libajnetmask.so && \
    chmod +r /ajcore.jar

COPY rootfs/ /

EXPOSE ${CORE_PORT} ${XML_PORT}

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://127.0.0.1:${XML_PORT} || exit 1

ENTRYPOINT ["/init"]

CMD ["/opt/java/openjdk/bin/java", "-Duser.home=/config", "-XX:MaxRAMPercentage=95.0", "-jar", "/ajcore.jar"]

SHELL ["/bin/bash"]
