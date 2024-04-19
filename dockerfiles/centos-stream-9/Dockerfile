# https://hub.docker.com/r/alvistack/centos-9-stream
FROM alvistack/centos-9-stream

RUN yum -y install ruby-devel-3.3.0-6.26
RUN yum -y install file-devel \
                   gcc \
                   gcc-c++ \
                   make \
                   git \
                   ImageMagick-devel \
                   poppler-utils \
                   curl

# Install RubyGems https://rubygems.org/gems/rubygems-update
RUN curl -sSL https://rubygems.org/rubygems/rubygems-3.5.9.tgz | tar xz -C /tmp && \
    cd /tmp/rubygems-3.5.9 && \
    ruby setup.rb && \
    gem install bundler && \
    rm -rf /tmp/rubygems-3.5.9

COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN bundle config set without 'development' && \
    bundle install
RUN yum -y install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
RUN yum -y install onlyoffice-documentbuilder

CMD /bin/bash -c "onlyoffice-documentbuilder -v; \
                  cd /doc-builder-testing; \
                  rake rspec_critical"
