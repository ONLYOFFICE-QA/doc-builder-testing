FROM ruby:3.4

LABEL maintainer="Pavel Lobashov <shockwavenn@gmail.com>"

RUN apt-get update && apt-get install -y -q \
      git \
      curl \
      libmagic-dev \
      poppler-utils \
      time \
    && curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE \
      | gpg --dearmor -o /usr/share/keyrings/onlyoffice.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] http://download.onlyoffice.com/repo/debian squeeze main" \
      > /etc/apt/sources.list.d/onlyoffice.list \
    && apt-get update && apt-get install -y onlyoffice-documentbuilder \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing

RUN bundle config set without 'development' && bundle install

ENTRYPOINT ["rake"]
