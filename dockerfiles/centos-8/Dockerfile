FROM centos:8

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

# ImageMagic only in epel repo
RUN dnf install -y epel-release
# `PowerTools` need to correct install ImageMagic dependencies
RUN dnf install -y 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled PowerTools
RUN yum -y install file-devel \
                   gcc \
                   git \
                   ImageMagick-devel \
                   # /usr/lib/rpm/redhat/redhat-hardened-cc1: No such file or directory
                   # on gems install
                   redhat-rpm-config \
                   ruby-devel \
                   make \
                   # fatal error: zlib.h: No such file or directory
                   # on `gem install nokogiri`
                   zlib
# Workaround for `find_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)                   
RUN gem update --system --install-dir=/usr/share/gems --bindir /usr/local/bin --no-ri --no-rdoc
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
