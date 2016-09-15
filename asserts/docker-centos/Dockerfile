FROM centos:latest

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN yum -y install ruby ruby-devel git gcc make file-devel zlib-devel
RUN gem install bundler
RUN git clone https://github.com/ONLYOFFICE/doc-builder-testing && cd /doc-builder-testing && /bin/bash -l -c 'bundle install'
RUN echo $'[documentbuilder] \n\
name            = onlyoffice-documentbuilder \n\
baseurl         = http://repo-doc-onlyoffice-com.s3.amazonaws.com/centos/7/onlyoffice-documentbuilder/origin/develop/latest/ \n\
enabled         = 1 \n\
gpgcheck        = 0' > /etc/yum.repos.d/documentbuilder.repo
RUN yum -y install onlyoffice-documentbuilder
CMD /bin/bash -l -c "[ ! -z \"$UPDATE_DOCUMENTBUILDER\" ] && yum -y update onlyoffice-documentbuilder; \
                     onlyoffice-documentbuilder; \
                     cd /doc-builder-testing; \
                     git pull; \
                     git checkout $DOCKER_BRANCH; \
                     rm Gemfile.lock; \
                     bundle install; \
                     bundle exec parallel_rspec spec"