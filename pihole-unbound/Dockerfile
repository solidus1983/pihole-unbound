FROM pihole/pihole:2022.02.1
RUN apt update && apt install -y unbound cron && apt upgrade -y


COPY lighttpd-external.conf /etc/lighttpd/external.conf 
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY start_unbound_and_s6_init.sh start_unbound_and_s6_init.sh
RUN chmod +x start_unbound_and_s6_init.sh
ENTRYPOINT ./start_unbound_and_s6_init.sh

#Add Cron Job for pihole -G
COPY pihole-cron /etc/cron.d/pihole-cron
RUN chmod a+x /etc/cron.d/pihole-cron
RUN crontab -l | { cat; echo "* * * * * bash /etc/cron.d/pihole-cron"; } | crontab -
CMD cron

#Certs for Ubound
RUN curl -L https://www.internic.net/domain/named.root --output /var/lib/unbound/root.hints 

#FixFlush
Run rm -rf /opt/pihole/piholeLogFlush.sh
Copy piholeLogFlush.sh /opt/pihole
Run chmod +x /opt/pihole/piholeLogFlush.sh