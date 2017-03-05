#!/bin/bash

set -e

function build-server-block {

	DOMAIN=$(basename $1)

	echo "Processing $DOMAIN ...";

	CERTS=$(<shared/certs.conf)
	CERTS="${CERTS//_DOMAIN_/$DOMAIN}"

	LOGS=$(<shared/logs.conf)
	LOGS="${LOGS//_DOMAIN_/$DOMAIN}"

	REDIRECT=$(<shared/www-redirect.conf)
	REDIRECT="${REDIRECT//_DOMAIN_/$DOMAIN}"

	REDIRECTSSL=$(<shared/www-redirect-ssl.conf)
	REDIRECTSSL="${REDIRECTSSL//_DOMAIN_/$DOMAIN}"
	REDIRECTSSL="${REDIRECTSSL//_CERTS_/$CERTS}"

	RESULT=$(<$1)
	RESULT="${RESULT//_DOMAIN_/$DOMAIN}"
	RESULT="${RESULT//_CERTS_/$CERTS}"
	RESULT="${RESULT//_LOGS_/$LOGS}"
	RESULT="${RESULT//_REDIRECT_/$REDIRECT}"
	RESULT="${RESULT//_REDIRECTSSL_/$REDIRECTSSL}"

	printf "$RESULT" > dist/sites-enabled/$DOMAIN

}

function build {
	rm -rf dist/
	mkdir -p dist/sites-enabled
	mkdir -p dist/snippets

	for config in sites/*; 
	do 
		build-server-block $config
	done

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Build completed."
}

build
