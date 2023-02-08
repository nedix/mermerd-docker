FROM golang:1.19-alpine as build

ARG MERMERD_VERSION=v0.5.0

RUN apk add --virtual .build-deps \
        git \
    && export CGO_ENABLED=0  \
    && go install github.com/KarnerTh/mermerd@$MERMERD_VERSION \
    && apk del .build-deps

FROM gcr.io/distroless/static

COPY --from=build /go/bin/mermerd /usr/bin

ENTRYPOINT ["/usr/bin/mermerd"]
