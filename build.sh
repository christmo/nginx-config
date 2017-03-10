#!/bin/sh 

set -e

build () {
	rm -rf dist/
	mkdir -p dist/sites-enabled
	mkdir -p dist/snippets

	cd sites
	for template in *.erb; 
	do 
		echo "Generating ${template%.*}"
		erb -r ../render.rb $template > ../dist/sites-enabled/${template%.*}
	done
	cd ..

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Build completed."
}

build
