FROM ruby:3.4

LABEL maintainer="Maksim.Sorokin@onlyoffice.com"

ENV ONLYOFFICE_BUILDER_LICENSE="/secrets/license.xml"

RUN apt-get update && apt-get -y -q install git \
                                            curl \
                                            libmagic-dev \
                                            poppler-utils \
                                            time \
                                            tar  \
                                            && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing

RUN gem install bundler
RUN bundle config set without 'development' \
    && bundle install

RUN ./dockerfiles/debian-next-release/portable.sh

ENTRYPOINT ["rake"]
