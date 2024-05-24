FROM ruby:3.3

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ENV VERSION="99.99.99"
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
    apt-get -y install onlyoffice-documentbuilder
RUN cat /etc/apt/sources.list.d/onlyoffice-dev.list

CMD /bin/bash -c "onlyoffice-documentbuilder -v; \
                  cd /doc-builder-testing; \
                  rake rspec_critical"
