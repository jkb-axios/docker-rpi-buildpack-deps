# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER Kipp Bowen <kipp.bowen@axiosengineering.com>

# Install just the basics and scm tools
RUN apt-get update && apt-get install -y --no-install-recommends \
#            apt-utils \
            locales \
            ca-certificates \
            curl \
            wget \
            openssh-client \
            git \
            subversion \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
    && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo 'LANG='${LANG}'\nLANGUAGE='${LANGUAGE}'\nLC_ALL='${LC_ALL} > /etc/default/locale

# Add various build deps/tools
RUN apt-get update && apt-get install -y \
#            pv \
            autoconf \
            build-essential \
            libcurl4-gnutls-dev \
#            libcurl4-openssl-dev \
#            imagemagick \
#            libbz2-dev \
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

# Add vim, python, ruby, couchdb, nodejs,
RUN apt-get update && apt-get install -y --no-install-recommends \
            vim \
            python-dev \
            python-pip \
#            python-virtualenv \
#            python3-dev \
#            python3-pip \
            couchdb \
            python-couchdb \
            ruby \
            ruby-dev \
            rubygems \
            nodejs=0.6.19~dfsg1-6 \
            nodejs-dev \
            npm \
    && rm -rf /var/lib/apt/lists/*

# Add node modules
#RUN apt-get update && apt-get install -y --no-install-recommends \
#            node-abbrev \
#            node-block-stream \
#            node-fstream \
#            node-graceful-fs \
#            node-inherits \
#            node-ini \
#            node-lru-cache \
#            node-minimatch \
#            node-mkdirp \
#            node-node-uuid \
#            node-nopt \
#            node-request \
#            node-rimraf \
#            node-semver \
#            node-tar \
#            node-which \
#    && rm -rf /var/lib/apt/lists/*

RUN npm config set registry http://registry.npmjs.org/ \
    && npm install -g express@3.0.0 \
            mustache@1.0.0 \
            oauth@0.9.12 \
            socket.io@0.8.7
#RUN npm config set registry https://registry.npmjs.org/

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN ln -s `which nodejs` /usr/bin/node
