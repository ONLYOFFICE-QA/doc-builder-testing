FROM ghcr.io/onlyoffice-qa/rocky-ruby-image:3.3.1

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN bundle config set without 'development' && \
    bundle install
RUN dnf -y install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
RUN dnf -y install onlyoffice-documentbuilder
ENTRYPOINT ["rake"]
