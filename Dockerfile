FROM alpine:latest

ARG UUID="d9686f74-96b0-49d5-af95-b9b9ad8bb682"

COPY ./content /workdir/

RUN apk add --no-cache curl runit caddy jq \
    && chmod +x /workdir/service/*/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENV PORT=3000

EXPOSE 3000

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
