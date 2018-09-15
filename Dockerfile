ARG arch=amd64
FROM ${arch}/alpine:3.8
COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static
COPY tmp/qemu-aarch64-static /usr/bin/qemu-aarch64-static

LABEL maintainer="Oliver Mazur"
LABEL Description="Eclipse Mosquitto MQTT Broker. This Image uses alpine as base image"

RUN apk update && \
    apk upgrade
    
RUN apk add mosquitto && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto && \
    rm -rf /var/cache/apk/*
   
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
