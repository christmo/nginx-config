server {
    server_name moon-travel.com.ua www.moon-travel.com.ua;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name moon-travel.com.ua www.moon-travel.com.ua;
    
    access_log /var/log/nginx/moon-travel.com.ua.out.log;
    error_log /var/log/nginx/moon-travel.com.ua.err.log;

    ssl_certificate /etc/letsencrypt/live/moon-travel.com.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/moon-travel.com.ua/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    location / {
        return 301 https://visasupport.kiev.ua;
    }

    include /etc/nginx/snippets/deny_locations.conf;
    include /etc/nginx/snippets/letsencrypt.conf;
}
