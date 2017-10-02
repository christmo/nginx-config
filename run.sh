#!/bin/bash 

set -e

docker run \
	--name nginx \
	-itd \
	-p 80:80 \
	-p 443:443 \
	-v /etc/letsencrypt/:/etc/letsencrypt/ \
	-v /etc/ssl/certs/dhparam.pem:/etc/ssl/certs/dhparam.pem \
	registry.dbogatov.org/dbogatov/nginx-config
