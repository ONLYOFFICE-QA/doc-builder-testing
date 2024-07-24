FROM ruby:3.3

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
# Install gpg key
RUN mkdir -p -m 700 ~/.gnupg
RUN curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --import
RUN chmod 644 /tmp/onlyoffice.gpg
RUN chown root:root /tmp/onlyoffice.gpg
RUN mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
# Write repository & install docbuilder
RUN echo "deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] http://download.onlyoffice.com/repo/debian squeeze main" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get -y install onlyoffice-documentbuilder
CMD /bin/bash -c "onlyoffice-documentbuilder -v; \
                  cd /doc-builder-testing; \
                  rake unittests"
