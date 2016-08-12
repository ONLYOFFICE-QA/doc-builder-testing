FROM ruby:2.3

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev

RUN gem install bundler
RUN git clone https://github.com/ONLYOFFICE/doc-builder-testing && cd /doc-builder-testing && /bin/bash -l -c 'bundle install'

RUN echo "deb http://repo-doc-onlyoffice-com.s3.amazonaws.com/ubuntu/trusty/onlyoffice-documentbuilder/origin/develop/latest/ repo/" >> /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get --allow-unauthenticated -y install onlyoffice-documentbuilder

CMD /bin/bash -l -c "cd /doc-builder-testing; git pull; rm Gemfile.lock; bundle install; bundle exec parallel_rspec spec"