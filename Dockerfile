FROM --platform=linux/arm64 alpine:3.19

ARG HUGO_VERSION=0.123.8
ARG TARGETARCH=arm64

RUN apk add --no-cache wget libc6-compat libstdc++ \
    && wget -O /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${TARGETARCH}.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin hugo \
    && rm /tmp/hugo.tar.gz

COPY jgrc2023 /src/jgrc2023
COPY jgrc2020 /src/jgrc2020

RUN cd /src/jgrc2023 && hugo --minify --baseURL "https://rxjgrc.roppongi.express/" -d /build \
    && cd /src/jgrc2020 && hugo --minify --baseURL "https://rxjgrc.roppongi.express/2020/" -d /build/2020

CMD ["cp", "-r", "/build/.", "/output/"]
