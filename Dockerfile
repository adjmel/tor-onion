FROM debian:bullseye-slim

# Mettre à jour les paquets et installer 
RUN apt-get -y update 

RUN apt-get update && apt-get install -y openssh-server
COPY sshd_config /etc/ssh/sshd_config

RUN apt-get update -y 
RUN apt-get install -y nginx

RUN useradd -m -s /bin/bash user \
	&& echo "user:password" | chpasswd

COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && apt-get install -y tor
RUN mkdir -p /var/lib/tor/hiddenservicename

COPY torrc /etc/tor/torrc

COPY setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]