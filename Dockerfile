FROM haugene/transmission-openvpn
MAINTAINER Bruno Perel

VOLUME /data
VOLUME /config

ADD transmission-rss/transmission-rss.conf /etc/transmission-rss.conf
ADD transmission-rss/transmission-rss-start.sh /etc/transmission-rss-start.sh

# Update packages and install software
RUN apt-get update \
    && apt-get install -y ruby ruby-dev build-essential && gem install transmission-rss \
    && chmod a+x /etc/transmission-rss-start.sh \
    && sed -i -e 's/127.0.0.1/*.*.*.*/' /etc/transmission-daemon/settings.json \
    && sed -i -e 's/"rpc-authentication-required": .*/"rpc-authentication-required": false,/' /etc/transmission-daemon/settings.json

ENV RSS_URL=**None**

CMD ["/etc/transmission-rss-start.sh"]
