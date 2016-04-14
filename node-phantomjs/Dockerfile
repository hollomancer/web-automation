FROM ubuntu:trusty
MAINTAINER hollomancer (conrad@sparkmeter.io)

USER root
RUN apt-get -y update && \
  apt-get -y dist-upgrade
RUN apt-get -y build-dep phantomjs && \
  apt-get install -y g++ build-essential python flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev libx11-dev libxext-dev git-core
WORKDIR /usr/local
RUN git clone https://github.com/ariya/phantomjs.git
WORKDIR /usr/local/phantomjs
RUN ./build.py --confirm && \
  ln -s /usr/local/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  apt-get autoremove -y && \
  apt-get clean all
ADD join-hub.sh /usr/local/phantomjs/
ENTRYPOINT sh /usr/local/phantomjs/join-hub.sh
