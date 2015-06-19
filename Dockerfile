# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Kipp Bowen <kipp.bowen@axiosengineering.com>

# Install just the basics and scm tools
RUN apt-get update && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            wget \
            openssh-client \
            git \
            subversion \
    && rm -rf /var/lib/apt/lists/*

# Add various build deps/tools
RUN apt-get update && apt-get install -y \
            vim \
            autoconf \
            build-essential \
#            pv \
#            imagemagick \
#            libbz2-dev \
#            libcurl4-openssl-dev \
#            libcurl4-gnutls-dev \
#            libevent-dev \
#            libffi-dev \
#            libglib2.0-dev \
#            libjpeg-dev \
#            libmagickcore-dev \
#            libmagickwand-dev \
#            libmysqlclient-dev \
#            libncurses-dev \
#            libpq-dev \
#            libreadline-dev \
#            libsqlite3-dev \
#            libssl-dev \
#            libxml2-dev \
#            libxslt-dev \
#            libyaml-dev \
#            zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Add python, ruby, couchdb, nodejs,
RUN apt-get update && apt-get install -y --no-install-recommends \
            python-dev \
            python-pip \
            python-virtualenv \
            python3-dev \
            python3-pip \
            couchdb \
            python-couchdb \
            ruby \
            rubygems \
            nodejs=0.6.19~dfsg1-6 \
            nodejs-dev \
            npm \
    && rm -rf /var/lib/apt/lists/*

# Add node modules?
#RUN apt-get update && apt-get install -y \
#    node-abbrev \
#    node-block-stream \
#    node-fstream \
#    node-graceful-fs \
#    node-inherits \
#    node-ini \
#    node-lru-cache \
#    node-minimatch \
#    node-mkdirp \
#    node-node-uuid \
#    node-nopt \
#    node-request \
#    node-rimraf \
#    node-semver \
#    node-tar \
#    node-which \
#    --no-install-recommends && \
#    rm -rf /var/lib/apt/lists/*

