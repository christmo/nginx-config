server {
    server_name travelus.com.ua www.travelus.com.ua;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name travelus.com.ua www.travelus.com.ua;

    access_log /var/log/nginx/travelus.com.ua.out.log;
    error_log /var/log/nginx/travelus.com.ua.err.log;

    ssl_certificate /etc/letsencrypt/live/www.travelus.com.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/www.travelus.com.ua/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /var/static/VisaSupport/travelus.com.ua/;

    location = / {
        index index.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;
    
    include /etc/nginx/snippets/letsencrypt.conf;
}
