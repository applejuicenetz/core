FROM openjdk:8-jre-alpine

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG TARGETARCH

ENV PUID=1000
ENV PGID=1000

ENV CORE_PORT=9850
ENV XML_PORT=9851

ADD https://github.com/applejuicenet/ajnetmask/releases/download/1.0.0/libajnetmask-${TARGETARCH}.so /usr/lib/libajnetmask.so
ADD https://github.com/applejuicenet/core/releases/download/${VERSION}/ajcore.jar /ajcore.jar

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

LABEL org.label-schema.name="appleJuice Core" \
      org.label-schema.version=${VERSION} \
      org.label-schema.vendor="appleJuiceNET" \
      org.label-schema.url="https://applejuicenet.de" \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.vcs-url="https://github.com/applejuicenet/core" \
      org.label-schema.schema-version="1.0"
