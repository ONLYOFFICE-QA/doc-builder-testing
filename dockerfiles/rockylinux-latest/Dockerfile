FROM ghcr.io/onlyoffice-qa/rocky-ruby-image:3.4.1

LABEL maintainer="Maksim.Sorokin@onlyoffice.com"

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing

RUN bundle config set without 'development' && bundle install && \
    dnf -y install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm && \
    dnf -y install onlyoffice-documentbuilder && \
    dnf clean all

ENTRYPOINT ["rake"]
