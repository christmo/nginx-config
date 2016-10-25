server {
    server_name shevastream.com;

    include /etc/nginx/snippets/http_redirect.conf;
}

server {
    server_name www.shevastream.com;

    include /etc/nginx/snippets/ssl_config.conf;

    include /etc/nginx/snippets/letsencrypt.conf;
    
    ssl_certificate /etc/letsencrypt/live/shevastream.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/shevastream.com/privkey.pem;

    return 301 $scheme://shevastream.com$request_uri;
}

server {
    server_name shevastream.com;

    access_log /var/log/nginx/shevastream.com.out.log main_ext;
    error_log /var/log/nginx/shevastream.com.err.log warn;
    
    ssl_certificate /etc/letsencrypt/live/shevastream.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/shevastream.com/privkey.pem;

    include /etc/nginx/snippets/ssl_config.conf;
    
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
