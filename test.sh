#!/bin/sh 

set -e

setup () {
	
	cp dist/* /etc/nginx

	echo "Setup completed."
}

setup

nginx -t
