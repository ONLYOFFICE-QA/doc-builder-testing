FROM ruby:2.7

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ENV VERSION="release/v6.0.0"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev \
                                            poppler-utils

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN echo $VERSION
RUN echo "deb [trusted=yes]  http://repo-doc-onlyoffice-com.s3.amazonaws.com/ubuntu/trusty/onlyoffice-documentbuilder/origin/${VERSION}/latest/amd64/ repo/" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder
RUN cat /etc/apt/sources.list.d/onlyoffice.list

CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  rake rspec_critical"
