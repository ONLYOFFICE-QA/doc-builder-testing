FROM ubuntu:16.04

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN apt-get update && apt-get -y -q install git curl
# Ruby Install
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN git clone https://github.com/ONLYOFFICE/doc-builder-testing && cd /doc-builder-testing && /bin/bash -l -c 'source "/usr/local/rvm/scripts/rvm"' && /bin/bash -l -c 'bundle install'

RUN echo "deb http://repo-doc-onlyoffice-com.s3.amazonaws.com/ubuntu/trusty/onlyoffice-documentcreator/origin/develop/latest/ repo/" >> /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get --allow-unauthenticated -y install onlyoffice-documentcreator

CMD /bin/bash -l -c "cd /doc-builder-testing; git pull; bundle install; rspec"