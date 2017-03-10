#!/bin/bash 

set -e

function setup {
	
	cp dist/* /etc/nginx

	echo "Setup completed."
}

setup

nginx -t
