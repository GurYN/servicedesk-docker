FROM local/service-desk:9.2

RUN apt-get purge \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/my_init.d
COPY servicedesk.sh /etc/my_init.d/servicedesk
RUN chmod +x /etc/my_init.d/servicedesk

VOLUME ["/opt/ManageEngine/ServiceDesk/custom"]

EXPOSE 8080

CMD ["/sbin/my_init"]
