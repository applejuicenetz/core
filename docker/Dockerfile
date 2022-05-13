FROM eclipse-temurin:11-jre-focal

ARG BUILD_DATE \
    VERSION \
    VCS_REF \
    TARGETARCH

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
    chmod +r /ajcore.jar && \
    groupadd -g ${PGID} abc && \
    useradd -u ${PUID} -g ${PGID} -d ${HOME} abc

COPY rootfs/ /

EXPOSE ${CORE_PORT} ${XML_PORT}

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://localhost:${XML_PORT} || exit 1

ENTRYPOINT ["/init"]

CMD ["/opt/java/openjdk/bin/java", "-XX:MaxRAMPercentage=98.0", "-jar", "/ajcore.jar"]

SHELL ["/bin/bash"]

LABEL org.opencontainers.image.version=${VERSION} \
      org.opencontainers.image.vendor="appleJuiceNETZ" \
      org.opencontainers.image.url="https://applejuicenet.cc" \
      org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.source="https://github.com/applejuicenetz/core"
