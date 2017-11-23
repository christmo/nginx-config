#!/usr/bin/env bash 

set -e

function build {

	rm -rf dist/
	mkdir -p dist/sites-available
	mkdir -p dist/snippets

	source sites.sh

	mkdir -p dist/tmp-erb

	for site in "${!SITES[@]}" 
	do
		echo "Generating $site..."

		HOST=${site//./-}

		if [ -n "${SITES[$site]}" ]; then
			HOST=${SITES[$site]}
		fi

		cp partials/proxy.erb dist/tmp-erb/$site

		sed -i -e "s/__DOMAIN__/$site/g" dist/tmp-erb/$site
		sed -i -e "s/__HOST__/$HOST/g" dist/tmp-erb/$site
		sed -i -e "s/__UPSTREAM__/${site//./_}/g" dist/tmp-erb/$site

		cd partials

		erb -r ../render.rb ../dist/tmp-erb/$site > ../dist/sites-available/$site

		cd ..
	done

	rm -rf dist/tmp-erb

	cd sites

	if [ $(ls -1 *.erb 2>/dev/null | wc -l) -gt 0 ]; then
		for template in *.erb; 
		do 
			echo "Regenerating ${template%.*}..."
			erb -r ../render.rb $template > ../dist/sites-available/${template%.*}
		done
	fi
	cd ..

	cp snippets/* dist/snippets/
	cp nginx.conf mime.types dist/

	echo "Build completed."
}

build
