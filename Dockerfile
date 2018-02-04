FROM debian:sid

ARG uid=1000
ARG gpg_key=2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN apt-get update               \
    && apt-get install -y        \
          bzip2                  \
          gnupg                  \
          openjdk-9-jre-headless \
          unzip                  \
          xz-utils               \
    && apt-get clean

RUN echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list \
     && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $gpg_key         \
     && apt-get update                                                                \
     && apt-get install -y sbt

RUN useradd -m -u $uid app

ENV USER app
