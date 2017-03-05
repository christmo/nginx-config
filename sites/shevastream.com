_REDIRECTSSL_

_REDIRECT_

server {
	server_name _DOMAIN_;

	_LOGS_

	_CERTS_

	include /etc/nginx/snippets/includes.conf;
    
    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Connection keep-alive;
    }

    include /etc/nginx/snippets/deny_locations.conf;
    include /etc/nginx/snippets/letsencrypt.conf;

    location ~*  \.(jpg|jpeg|png|gif|ico)$ {
        expires 30d;
        proxy_pass http://localhost:5000;
        proxy_set_header Connection keep-alive;
    }

    location ~*  \.(css|js)$ {
        expires 7d;
        proxy_pass http://localhost:5000;
        proxy_set_header Connection keep-alive;
    }

    location ~*  \.(woff)$ {
        expires 1y;
        proxy_pass http://localhost:5000;
        proxy_set_header Connection keep-alive;
    }

    location ~*  \.(pdf)$ {
        expires 15d;
	    proxy_pass http://localhost:5000;
        proxy_set_header Connection keep-alive;
    }
}
