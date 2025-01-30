FROM quay.io/frrouting/frr:10.2.1

RUN apk update 
RUN apk add --no-cache bash util-linux iputils inetutils-telnet

ENV DAEMONS="zebra bgpd ospfd isisd"

# The watchfrr, zebra and staticd daemons are always started.
RUN sed -i -e "s/bgpd=no/bgpd=yes/g" /etc/frr/daemons && \
    sed -i -e "s/ospfd=no/ospfd=yes/g" /etc/frr/daemons && \
    sed -i -e "s/isisd=no/isisd=yes/g" /etc/frr/daemons && \
    sed -i '/^#frr_profile="traditional"/s/^#//' /etc/frr/daemons && \
    touch /etc/frr/vtysh.conf

ENTRYPOINT ["bash", "-c", "/usr/lib/frr/docker-start & exec bash"]

# MAX_FDS=1024