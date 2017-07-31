FROM raphaelmeyer/base:1.3.0

MAINTAINER Raphael Meyer <raphael.meyer@bbv.ch>

USER root

RUN apt-get update && apt-get install -y \
  clang \
  cmake \
  g++ \
  git \
  libboost-all-dev \
  make \
  ruby \
  ruby-dev

RUN gem install cucumber oj

USER user

VOLUME ["/workspace"]
WORKDIR /workspace

