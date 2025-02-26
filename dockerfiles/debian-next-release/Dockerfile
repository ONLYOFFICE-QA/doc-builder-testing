FROM ruby:3.4

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ENV VERSION="8.3.1"
ENV DIST="stable"

RUN apt-get update && apt-get -y -q install git \
                                            curl \
                                            libmagic-dev \
                                            poppler-utils

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN echo "deb [trusted=yes] https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/repo/debian $DIST $VERSION" | \
    tee /etc/apt/sources.list.d/onlyoffice-dev.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder=$VERSION-*
RUN cat /etc/apt/sources.list.d/onlyoffice-dev.list

ENTRYPOINT ["rake"]
