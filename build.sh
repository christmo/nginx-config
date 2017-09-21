#!/bin/bash 

set -e

function build {
	rm -rf dist/
	mkdir -p dist/sites-available
	mkdir -p dist/snippets

	source sites.sh

	mkdir -p dist/tmp-erb

	for ((i = 0; i < ${#SITES[@]}; ++i)); 
	do
		echo "Generating ${SITES[$i]}..."

		cp partials/proxy.erb dist/tmp-erb/${SITES[$i]}

		sed -i -e "s/__DOMAIN__/${SITES[$i]}/g" dist/tmp-erb/${SITES[$i]}
		sed -i -e "s/__PORT__/${PORTS[$i]}/g" dist/tmp-erb/${SITES[$i]}

		cd partials

		erb -r ../render.rb ../dist/tmp-erb/${SITES[$i]} > ../dist/sites-available/${SITES[$i]}

		cd ..
	done

	rm -rf dist/tmp-erb

	# cd sites
	# for template in *.erb; 
	# do 
	# 	echo "Generating ${template%.*}..."
	# 	erb -r ../render.rb $template > ../dist/sites-available/${template%.*}
	# done
	# cd ..

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Build completed."
}

build
