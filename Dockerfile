FROM ubuntu:trusty
MAINTAINER Santosh Chituprolu

#Prevent dpkg errors
ENV TERM=xterm-256
RUN sed -i 's/http\:\/\/archive/http\:\/\/au.archive/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y -o APT::Install-Recommend=false -o API::Install-Suggests=false python python-virtualenv

RUN virtualenv /appenv && . /appenv/bin/activate && pip install pip --upgrade

#Add Entrypoint Script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
