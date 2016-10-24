server {
    server_name darinagulley.com www.darinagulley.com;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name darinagulley.com www.darinagulley.com;

    access_log /var/log/nginx/darinagulley.com.out.log;
    error_log /var/log/nginx/darinagulley.com.err.log;
    
    ssl_certificate /etc/letsencrypt/live/www.darinagulley.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/www.darinagulley.com/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /srv/www/html/DashaWebsite;

    location = / {
        index video.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;
    include /etc/nginx/snippets/deny_locations.conf;
    include /etc/nginx/snippets/letsencrypt.conf;
}
