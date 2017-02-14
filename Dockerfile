# Dockerfile for image development
# Usage: docker run sternmotor/devbase --help. 
# When started as daemon, dnsmasq is started as dummy daemon

# BUILD AND IMAGE ENVIRONMENT ------------------------------------------------

FROM debian:jessie

# pin down version so image gets re-build at version change
LABEL version='8.2' description='Dockerfile for image development' 

# INSTALL APPLICATION --------------------------------------------------------

ENV LC_ALL=C.UTF-8 LANG=en_US.UTF-8 LC_MESSAGES=POSIX HOME=/root
RUN apt-get update --quiet > /dev/null \
 && DEBIAN_FRONTEND=noninteractive apt-get install --yes --force-yes \
       atop \
       bzip2 \
       dnsmasq \
       dnsutils \
       htop \
       lsb-release \
       nano \
       net-tools \
       pwgen \
       rsync \
       tcpdump \
       telnet \
       vim-nox \
       whois \
       zip \
 && apt-get clean && rm -rf /tmp/* /var/tmp/*

# CONFIGURE APPLICATION ------------------------------------------------------

# Deploy startup script and help file to file system root
COPY "entrypoint" "/usr/local/bin/docker-entrypoint"
COPY "README.md" "/usr/share/docker-readme.md"

# DOCKER INTEGRATION ---------------------------------------------------------

VOLUME [ "/srv" ]
EXPOSE 53

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "run" ] # start, reload, test, version, login, help
