#!/usr/bin/env bash

if [ "${RSS_URL}" = "**None**" ] ; then
 echo "RSS URL not set. Exiting."
 exit 1
fi

sed -i "s#RSS_URL#$RSS_URL#" /etc/transmission-rss.conf

service transmission-daemon restart && transmission-rss