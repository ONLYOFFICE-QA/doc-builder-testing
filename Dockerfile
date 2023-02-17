FROM ruby:3.2

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev \
                                            poppler-utils \
                                            time

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN wget --retry-on-http-error=500 -qO - "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xe09ca29f6e178040ef22b4098320ca65cb2de8e5" | \
    gpg --dearmor > /usr/share/keyrings/onlyoffice.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] http://download.onlyoffice.com/repo/debian squeeze main" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder
CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  rake"
