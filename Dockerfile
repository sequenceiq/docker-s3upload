FROM ubuntu:trusty

MAINTAINER SequenceIq

# install the ec2 cli tools
RUN apt-get update
RUN apt-get -y install awscli

ADD init.sh /etc/init.sh
RUN chmod +x /etc/init.sh

CMD "/etc/init.sh"
