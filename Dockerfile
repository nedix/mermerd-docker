FROM golang:1.19-alpine

ARG MERMERD_VERSION=v0.5.0

RUN apk add --virtual .build-deps \
        git \
    && go install github.com/KarnerTh/mermerd@$MERMERD_VERSION \
    && apk del .build-deps

WORKDIR /root

ENTRYPOINT ["/go/bin/mermerd", "--runConfig", "/root/.mermerd"]
