_REDIRECTSSL_

_REDIRECT_

server {
    server_name _DOMAIN_;

    _LOGS_

	_CERTS_

	include /etc/nginx/snippets/includes.conf;

    root /srv/www/html/DashaWebsite;

    location = / {
        index video.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }
}
