FROM ruby:3.4

LABEL maintainer="Pavel.Lobashov <shockwavenn@gmail.com>"

ENV VERSION="99.99.99" \
    DIST="stable"

RUN apt-get update && apt-get install -y -q \
    git \
    curl \
    libmagic-dev \
    poppler-utils && \
    gem install bundler && \
    echo "deb [trusted=yes] https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/repo/debian $DIST $VERSION" > /etc/apt/sources.list.d/onlyoffice-dev.list && \
    apt-get update && \
    apt-get install -y onlyoffice-documentbuilder && \
    rm -rf /var/lib/apt/lists/*

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing

RUN bundle config set without 'development' && bundle install

ENTRYPOINT ["rake"]
