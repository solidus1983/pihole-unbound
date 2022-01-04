FROM pihole/pihole:2022.01
RUN apt update && apt install -y unbound && apt upgrade -y
RUN curl -L https://www.internic.net/domain/named.root --output /var/lib/unbound/root.hints 

COPY lighttpd-external.conf /etc/lighttpd/external.conf 
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY start_unbound_and_s6_init.sh start_unbound_and_s6_init.sh

RUN chmod +x start_unbound_and_s6_init.sh
ENTRYPOINT ./start_unbound_and_s6_init.sh
