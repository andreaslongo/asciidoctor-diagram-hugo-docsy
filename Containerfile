FROM docker.io/klakegg/hugo:0.91.2-ext-asciidoctor

# Install asciidoctor-diagram plugin

# Build deps
RUN apk add --no-cache \
    gcc \
    libc-dev \
    ruby-dev \
# Runtime deps \
&& apk add --no-cache \
    graphviz \
    openjdk8-jre \
&& gem install --no-document \
    json \
    asciidoctor-diagram \
# Cleanup \
&& apk del --no-cache \
    gcc \
    libc-dev \
    ruby-dev \
&& find /tmp -mindepth 1 -maxdepth 1 | xargs rm -rf
