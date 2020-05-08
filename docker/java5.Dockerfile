FROM ubuntu:14.04

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG TARGETARCH

ENV PUID=1000
ENV PGID=1000

ENV CORE_PORT=9850
ENV XML_PORT=9851

ENV JAVA_HOME /jre1.5.0_22

ADD jre-1_5_0_22-linux-${TARGETARCH}.bin /tmp/jre5.bin

RUN echo yes|sh /tmp/jre5.bin && rm -f /tmp/jre5.bin

ADD https://github.com/applejuicenet/ajnetmask/releases/download/1.0.0/libajnetmask-${TARGETARCH}.so /${JAVA_HOME}/lib/${TARGETARCH}/libajnetmask.so
ADD https://github.com/applejuicenet/core/releases/download/${VERSION}/ajcore.jar /ajcore.jar

RUN apt install -y curl && \
    chmod +r /${JAVA_HOME}/lib/*/libajnetmask.so && \
    chmod +r /ajcore.jar && \
    addgroup --gid $PGID abc && \
    adduser abc --uid $PUID --ingroup abc --home "/config" && \
    ln -s ${JAVA_HOME}/bin/java /usr/local/bin/java

COPY rootfs/ /

EXPOSE ${CORE_PORT} ${XML_PORT}

WORKDIR /config/appleJuice

VOLUME /config/appleJuice

HEALTHCHECK --interval=30s --start-period=10s CMD curl --fail http://localhost:${XML_PORT} || exit 1

ENTRYPOINT ["/init"]

CMD ["java", "-jar", "/ajcore.jar"]

SHELL ["/bin/bash"]

LABEL org.label-schema.name="appleJuice Core" \
      org.label-schema.version=${VERSION} \
      org.label-schema.vendor="appleJuiceNET" \
      org.label-schema.url="https://applejuicenet.de" \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.vcs-url="https://github.com/applejuicenet/core" \
      org.label-schema.schema-version="1.0"
