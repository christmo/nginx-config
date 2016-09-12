server {
    server_name visasupport.kiev.ua www.visasupport.kiev.ua;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name visasupport.kiev.ua www.visasupport.kiev.ua;

    ssl_certificate /etc/letsencrypt/live/visasupport.kiev.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/visasupport.kiev.ua/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /var/static/VisaSupport/visasupport.kiev.ua/;

    location = / {
        index index.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;

    include /etc/nginx/snippets/letsencrypt.conf;
}
