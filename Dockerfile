FROM ubuntu:14.04
MAINTAINER John Wesley <john.w.wes@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
  software-properties-common \
  sudo \
  net-tools \
  python-pip

RUN pip install speedtest-cli

RUN apt-add-repository -y ppa:i2p-maintainers/i2p && apt-get update

RUN apt-get -y install i2p

ENV DEBIAN_FRONTEND newt

EXPOSE 7657
EXPOSE 7658
EXPOSE 4444
EXPOSE 4445
EXPOSE 6668

RUN sed -i 's/false/true/' /etc/default/i2p
RUN service i2p start

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /var/lib/i2p/i2p-config/i2ptunnel.config
RUN sed -i 's/::1,127.0.0.1/0.0.0.0/g' /var/lib/i2p/i2p-config/clients.config
RUN echo "i2cp.tcp.bindAllInterfaces=true" >> /var/lib/i2p/i2p-config/router.config

CMD sudo /etc/init.d/i2p start && sudo tail -f /var/log/i2p/wrapper.log
