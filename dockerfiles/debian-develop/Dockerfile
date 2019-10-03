FROM ruby:2.6

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN /bin/bash -c 'bundle install --without development'
RUN echo "deb [trusted=yes]  http://repo-doc-onlyoffice-com.s3.amazonaws.com/ubuntu/trusty/onlyoffice-documentbuilder/origin/develop/latest/amd64/ repo/" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder

CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  bundle update; \
                  bundle exec parallel_rspec spec"
