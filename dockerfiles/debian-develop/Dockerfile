FROM ruby:3.2

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ENV VERSION="99.99.99"

RUN apt-get update && apt-get -y -q install git \
                                            curl \
                                            libmagic-dev \
                                            poppler-utils \
                                            lsb-release

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN echo "deb [trusted=yes] https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/repo/debian $(lsb_release -cs) $VERSION" | \
    tee /etc/apt/sources.list.d/onlyoffice-dev.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder

CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  rake rspec_critical"
