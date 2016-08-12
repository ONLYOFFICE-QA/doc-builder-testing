FROM ruby:2.3

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev

RUN git clone https://github.com/ONLYOFFICE/doc-builder-testing && cd /doc-builder-testing && /bin/bash -l -c 'bundle install'

RUN echo "deb http://repo-doc-onlyoffice-com.s3.amazonaws.com/ubuntu/trusty/onlyoffice-documentbuilder/origin/develop/latest/ repo/" >> /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get --allow-unauthenticated -y install onlyoffice-documentbuilder

CMD /bin/bash -l -c "cd /doc-builder-testing; git pull; rm Gemfile.lock; bundle install; parallel_rspec spec"