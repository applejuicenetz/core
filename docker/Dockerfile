FROM openjdk:8-jre-alpine

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG TARGETARCH

ENV PUID=1000
ENV PGID=1000

ENV CORE_PORT=9850
ENV XML_PORT=9851

ADD https://github.com/applejuicenetz/ajnetmask/releases/download/1.0.0/libajnetmask-${TARGETARCH}.so /usr/lib/libajnetmask.so
ADD https://github.com/applejuicenetz/core/releases/download/${VERSION}/ajcore.jar /ajcore.jar

RUN apk add --no-cache curl shadow sudo && \
    chmod +r /usr/lib/libajnetmask.so && \
    chmod +r /ajcore.jar && \
    addgroup -g $PGID abc &&\
    adduser -u $PUID -G abc -s /bin/ash -D abc --home "/config"

COPY rootfs/ /


EXPOSE ${CORE_PORT} ${XML_PORT}

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://localhost:${XML_PORT} || exit 1

ENTRYPOINT ["/init"]

CMD ["java", "-XX:MaxRAMPercentage=98.0", "-jar", "/ajcore.jar"]

SHELL ["/bin/ash"]

LABEL org.opencontainers.image.version=${VERSION} \
      org.opencontainers.image.vendor="appleJuiceNETZ" \
      org.opencontainers.image.url="https://applejuicenet.cc" \
      org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.source="https://github.com/applejuicenetz/core"
