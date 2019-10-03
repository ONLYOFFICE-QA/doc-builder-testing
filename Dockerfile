FROM ruby:2.6

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN /bin/bash -c 'bundle install --without development'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
RUN echo "deb http://download.onlyoffice.com/repo/debian squeeze main" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder
CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  bundle update; \
                  rake"
