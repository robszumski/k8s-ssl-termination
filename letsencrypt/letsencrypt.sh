#!/bin/bash

EMAIL=${EMAIL}
DOMAINS=(${DOMAINS})

if [ -z "$DOMAINS" ]; then
    echo "ERROR: Domain list is empty or unset"
    exit 1
fi

if [ -z "$EMAIL" ]; then
    echo "ERROR: Email is empty string or unset"
    exit 1
fi

echo "DOMAINS: " $DOMAINS
echo "EMAIL: " $EMAIL

domain_args=""
for i in "${DOMAINS[@]}"
do
   domain_args="$domain_args -d $i"
   # do whatever on $i
done

# /usr/local/bin/letsencrypt certonly \
#     --webroot -w /letsencrypt/challenges/ \
#     --text --renew-by-default --agree-tos \
#       $domain_args \
#      --email=$EMAIL

for domain_full in "${DOMAINS[@]}"
do
  domain_short=`echo $domain_full | sed 's/....$//'`
  echo "/letsencrypt/config/$domain_short.conf"
  cp backend.conf.template "/letsencrypt/config/$domain_short.conf"
  sed -i -e "s/%DOMAIN%/$domain_full/g" "/letsencrypt/config/$domain_short.conf"
  sed -i -e "s/%DOMAIN_SHORT%/$domain_short/g" "/letsencrypt/config/$domain_short.conf"
done