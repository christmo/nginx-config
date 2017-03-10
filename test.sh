#!/bin/bash 

set -e

function setup {
	
	cp -r dist/* /etc/nginx

	echo "Setup completed."
}

setup

nginx -t
