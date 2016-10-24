server {
    server_name visajapan.com.ua www.visajapan.com.ua;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name visajapan.com.ua www.visajapan.com.ua;
    
    access_log /var/log/nginx/visajapan.com.ua.out.log;
    error_log /var/log/nginx/visajapan.com.ua.err.log;
    
    ssl_certificate /etc/letsencrypt/live/visajapan.com.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/visajapan.com.ua/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /srv/www/html/VisaSupport-Websites/visajapan.com.ua/;

    location = / {
        index index.html;
    }

    location / {
        try_files $uri.html $uri =404;
    }

    include /etc/nginx/snippets/cache.conf;
    include /etc/nginx/snippets/deny_locations.conf;
    include /etc/nginx/snippets/letsencrypt.conf;
}
