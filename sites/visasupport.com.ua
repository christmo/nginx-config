_REDIRECTSSL_

_REDIRECT_

server {
	server_name _DOMAIN_;

	_LOGS_

	_CERTS_

	include /etc/nginx/snippets/includes.conf;

    root /srv/www/html/VisaSupport-Websites/visasupport.com.ua/;
    index index.php index.html index.htm default.html default.htm;

    client_max_body_size 100M;
    
    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    # deny running scripts inside writable directories
    location ~* /(images|cache|media|logs|tmp)/.*\.(php|pl|py|jsp|asp|sh|cgi)$ {
        return 403;
        error_page 403 /403_error.html;
    }
    
    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include /etc/nginx/fastcgi.conf;
    }
    
    # caching of files
    location ~* \.(ico|pdf|flv)$ {
        expires 1y;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|swf|xml|txt)$ {
        expires 14d;
    }
}
