#!/bin/bash 

set -e

function setup {
	
	source sites.sh

	for ((i = 0; i < ${#HOSTS[@]}; ++i)); 
	do
		echo "Generating host ${HOSTS[$i]}..."

		echo "127.0.0.1       ${HOSTS[$i]}" >> /etc/hosts
	done

	adduser -D www-data

	cp -r dist/* /etc/nginx
	mkdir -p /etc/nginx/sites-enabled
	mkdir -p /etc/nginx/ssl
	mkdir -p /etc/ssl/certs/

	openssl dhparam -out /etc/ssl/certs/dhparam.pem 256

	openssl req \
		-x509 \
		-nodes \
		-days 365 \
		-newkey rsa:2048 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/C=NL/ST=Whatever/L=Whatever/O=Whatever/OU=Whatever/CN=whatever.example.com"

	cd /etc/nginx/sites-available/

	for site in *; 
	do 
		ln -s /etc/nginx/sites-available/$site /etc/nginx/sites-enabled/$site 

		mkdir -p /etc/letsencrypt/live/$site
		cp /etc/nginx/ssl/nginx.key /etc/letsencrypt/live/$site/
		cp /etc/nginx/ssl/nginx.crt /etc/letsencrypt/live/$site/
		
		sed -i 's/fullchain.pem/nginx.crt/g' $site
		sed -i 's/privkey.pem/nginx.key/g' $site
	done

	echo "Setup completed."
}

setup

nginx -t
