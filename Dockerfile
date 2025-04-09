FROM ruby:3.4
LABEL maintainer="Maksim.Sorokin@onlyoffice.com"
RUN apt-get update && apt-get -y -q install git curl
RUN apt-get update && apt-get -y -q install libmagic-dev \
                                            poppler-utils \
                                            time \
                                            tar
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN gem install bundler
RUN bundle config set without 'development' && \
    bundle install

ENV ONLYOFFICE_BUILDER_LICENSE='/secrets/license.xml'

RUN ./portable
ENTRYPOINT ["rake"]
