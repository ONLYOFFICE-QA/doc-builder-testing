FROM ruby:3.1

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl wget
RUN apt-get update && apt-get -y -q install libmagic-dev \
                                            poppler-utils

RUN gem install bundler
RUN wget https://download.onlyoffice.com/install/desktop/docbuilder/documentbuilder-x64.tar.gz
RUN tar xvf documentbuilder-*.tar.gz
RUN mv /documentbuilder-4.4.1 /documentbuilder
RUN chmod -R 777 /documentbuilder
COPY . /doc-builder-testing
COPY asserts/documentbuilder /usr/bin/documentbuilder
RUN chmod +x /usr/bin/documentbuilder
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
CMD /bin/bash -c "documentbuilder; \
                  bundle exec parallel_rspec spec"
