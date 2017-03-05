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

	printf "$RESULT" > dist/$DOMAIN

}

function build {
	for config in sites/*; 
	do 
		build-server-block $config
	done
}

build
