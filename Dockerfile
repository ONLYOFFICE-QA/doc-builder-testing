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
RUN mkdir -p -m 700 ~/.gnupg
RUN gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
RUN echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder
CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  rake"
