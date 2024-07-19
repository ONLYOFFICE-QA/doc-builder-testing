FROM ruby:3.3

RUN apt-get update && \
    apt-get --no-install-recommends -y -q install \
        curl \
        git \
        libmagic-dev \
        poppler-utils \
        time && \
    rm -rf /var/lib/apt/lists/*
RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
# Install gpg key
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN mkdir -m 700 ~/.gnupg && \
    curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --import && \
    chmod 644 /tmp/onlyoffice.gpg && \
    chown root:root /tmp/onlyoffice.gpg && \
    mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
# Write repository & install docbuilder
RUN echo "deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] http://download.onlyoffice.com/repo/debian squeeze main" >> /etc/apt/sources.list.d/onlyoffice.list && \
    apt-get -y update && \
    apt-get --no-install-recommends -y install onlyoffice-documentbuilder && \
    rm -rf /var/lib/apt/lists/*
CMD ["bash", "entrypoint.sh"]
