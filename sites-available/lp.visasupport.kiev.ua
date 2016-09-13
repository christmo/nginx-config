server {
    server_name lp.visasupport.kiev.ua;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name lp.visasupport.kiev.ua;

    access_log /var/log/nginx/lp.visasupport.kiev.ua.out.log;
    error_log /var/log/nginx/lp.visasupport.kiev.ua.err.log;
    
    ssl_certificate /etc/letsencrypt/live/lp.visasupport.kiev.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/lp.visasupport.kiev.ua/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /var/static/VisaSupport/lp.visasupport.kiev.ua/;

    location = / {
        index index.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;

    include /etc/nginx/snippets/letsencrypt.conf;
}
