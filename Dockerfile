# Dockerfile for image development
# Usage: docker run sternmotor/devbase --help. 
# When started as daemon, dnsmasq is started as dummy daemon

# BUILD AND IMAGE ENVIRONMENT ------------------------------------------------

FROM debian:jessie
MAINTAINER Gunnar Mann <dev@sternmotor.net>

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

# Download and install seafile
#ENV VERSION='6.0.4' \
#    MIRROR='https://bintray.com/artifact/download/seafile-org/seafile'
#RUN wget "${MIRROR}/seafile-server_${VERSION}_x86-64.tar.gz" --quiet \
#    --no-check-certificate --output-document="/tmp/seafile.tar.gz" \
#&& tar -xzpf "/tmp/seafile.tar.gz" --directory /usr/share \
#&& rm "/tmp/seafile.tar.gz" \
#&& ln -s  "/usr/share/seafile-server-${VERSION}" /usr/share/seafile \
#&& ln -sf "/usr/share/seafile-server-${VERSION}" /srv/seafile-server-latest


# CONFIGURE APPLICATION ------------------------------------------------------

# users
#RUN useradd -m -d "$MAILDIR" --uid 1000 --gid dovecot \
#    -s /usr/sbin/nologin "$LOCAL_MAIL_USER" \
# && usermod --password $(mkpasswd "$LOCAL_MAIL_PASS" ) imap

# config files
#RUN sed -i "s|^mail_location =.*|mail_location = maildir:$MAILDIR|" \
#    /etc/dovecot/conf.d/10-mail.conf 

# forward nginx logs and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
# && ln -sf /dev/stderr /var/log/nginx/error.log \
# && rm -rf /etc/nginx/conf.d/* /etc/nginx/sites-enabled/* \
# && install --owner nginx --group nginx --directory -- /var/tmp/nginx /var/cache/nginx 

# DOCKER INTEGRATION ---------------------------------------------------------

# shared volumes and ports
VOLUME [ "/srv" ]
EXPOSE 53

# startup script and help file
COPY "entrypoint" "/starter"
ENTRYPOINT [ "/starter" ]
CMD [ "run" ] # start, reload, test, version, login, help

