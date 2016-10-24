server {
#    server_name moon-travel.com.ua www.moon-travel.com.ua;

    server_name temp.dbogatov.org;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
#    server_name moon-travel.com.ua www.moon-travel.com.ua;

    server_name temp.dbogatov.org;
    
    access_log /var/log/nginx/moon-travel.com.ua.out.log;
    error_log /var/log/nginx/moon-travel.com.ua.err.log;

#    ssl_certificate /etc/letsencrypt/live/moon-travel.com.ua/fullchain.pem;
#    ssl_certificate_key /etc/letsencrypt/live/moon-travel.com.ua/privkey.pem;
    ssl_certificate /etc/letsencrypt/live/temp.dbogatov.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/temp.dbogatov.org/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;

    root /srv/www/html/VisaSupport-Websites/moon-travel.com.ua/;
    index index.php index.html index.htm default.html default.htm;

    client_max_body_size 100M;
    
    location / {
        try_files $uri $uri/ /index.php?q=$uri&$args;
    }

    # deny running scripts inside writable directories
    location ~* /(images|cache|media|logs|tmp)/.*\.(php|pl|py|jsp|asp|sh|cgi)$ {
        return 403;
        error_page 403 /403_error.html;
    }
    
    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        include /etc/nginx/fastcgi.conf;
    }
    
    # caching of files
    location ~* \.(ico|pdf|flv)$ {
        expires 1y;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|swf|xml|txt)$ {
        expires 14d;
    }

    include /etc/nginx/snippets/deny_locations.conf;
    include /etc/nginx/snippets/letsencrypt.conf;
}
