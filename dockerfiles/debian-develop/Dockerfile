FROM ruby:3.1

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev \
                                            poppler-utils

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN echo "deb [trusted=yes] http://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/onlyoffice/repo-unstable/ubuntu trusty main" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder

CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  rake rspec_critical"
