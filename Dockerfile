# Use -slim version until https://github.com/docker-library/openjdk/issues/145 is fixed
FROM openjdk:9-slim

ARG uid=1000

RUN apt-get update && apt-get install --no-install-recommends -y gnupg

RUN echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
     apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
     apt-get update && \
     apt-get install -y sbt

RUN useradd -m -u $uid app

ENV USER app

ENTRYPOINT [ "/bin/bash" ]
