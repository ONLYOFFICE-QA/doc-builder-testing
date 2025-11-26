FROM ruby:3.4

LABEL maintainer="Pavel.Lobashov <shockwavenn@gmail.com>"

ENV VERSION="99.99.99" \
    DIST="stable"
ENV ONLYOFFICE_BUILDER_LICENSE="/secrets/license.xml"

RUN apt-get update
RUN apt-get install -y -q git
RUN apt-get install -y -q curl
RUN apt-get install -y -q libmagic-dev
RUN apt-get install -y -q poppler-utils
RUN gem install bundler
RUN rm -rf /var/lib/apt/lists/*

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing

RUN bundle config set without 'development' && bundle install
RUN ./dockerfiles/debian-develop/portable.sh

ENTRYPOINT ["rake"]
