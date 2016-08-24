server {
    server_name darinagulley.com www.darinagulley.com;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name darinagulley.com www.darinagulley.com;

    ssl_certificate /etc/letsencrypt/live/darinagulley.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/darinagulley.com/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /var/static/dashawebsite;

    location = / {
        index video.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;

    include /etc/nginx/snippets/letsencrypt.conf;
}
