FROM centos:7

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN yum -y install https://github.com/feedforce/ruby-rpm/releases/download/2.4.0/ruby-2.4.0-1.el7.centos.x86_64.rpm
RUN yum -y install file-devel \
                   gcc \
                   git \
                   ImageMagick-devel \
                   make
RUN gem install bundler
COPY . /doc-builder-testing
WORKDIR /doc-builder-testing
RUN /bin/bash -c 'bundle install --without development'
RUN yum -y install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
RUN yum -y install onlyoffice-documentbuilder
CMD /bin/bash -c "onlyoffice-documentbuilder; \
                  cd /doc-builder-testing; \
                  bundle update; \
                  bundle exec parallel_rspec spec"
