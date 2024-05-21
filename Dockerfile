FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    ca-certificates \
    build-essential \
    npm \
    --no-install-recommends

# install go
RUN wget https://golang.org/dl/go1.22.2.linux-amd64.tar.gz \
    && tar -xvf go1.22.2.linux-amd64.tar.gz \
    && mv go /usr/local \
    && rm go1.22.2.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# install tinygo
RUN wget https://github.com/tinygo-org/tinygo/releases/download/v0.31.2/tinygo_0.31.2_amd64.deb \
    && dpkg -i tinygo_0.31.2_amd64.deb \
    && rm tinygo_0.31.2_amd64.deb

# install Wrangler CLI
RUN npm install -g wrangler

WORKDIR /app
