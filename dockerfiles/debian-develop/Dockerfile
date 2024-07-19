FROM ruby:3.3

ENV VERSION="99.99.99"
ENV DIST="stable"

RUN apt-get update && \
    apt-get --no-install-recommends -y -q install \
                          git \
                          curl \
                          libmagic-dev \
                          poppler-utils && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN echo "deb [trusted=yes] https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/repo/debian $DIST $VERSION" | \
    tee /etc/apt/sources.list.d/onlyoffice-dev.list && \
    apt-get -y update && \
    apt-get --no-install-recommends -y install onlyoffice-documentbuilder && \
    rm -rf /var/lib/apt/lists/*
RUN cat /etc/apt/sources.list.d/onlyoffice-dev.list

CMD ["sh", "dockerfiles/entrypoint.sh"]
