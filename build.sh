#!/bin/sh 

set -e

build () {
	rm -rf dist/
	mkdir -p dist/sites-available
	mkdir -p dist/snippets

	SITES=""

	cd sites
	for template in *.erb; 
	do 
		echo "Generating ${template%.*}..."
		erb -r ../render.rb $template > ../dist/sites-available/${template%.*}
		SITES+="${template%.*} "
	done
	cd ..

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Generating all-sites-letsencrypt..."

	LETSENCRYPT=$(<all-sites-letsencrypt.conf)
	LETSENCRYPT="${LETSENCRYPT//_NAMES_/$SITES}"
	printf "$LETSENCRYPT" > dist/sites-available/all-sites-letsencrypt

	echo "Build completed."
}

build
