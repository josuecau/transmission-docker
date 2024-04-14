FROM alpine:20240329

ARG TZ=Europe/Paris

RUN apk --no-cache add tzdata transmission-daemon=4.0.5-r0 \
  && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
  && deluser transmission \
  && adduser -D -g '' -h /var/lib/transmission transmission

USER transmission

WORKDIR /var/lib/transmission

VOLUME /var/lib/transmission

EXPOSE 9091 54321 54321/udp

CMD ["transmission-daemon", "--foreground"]
