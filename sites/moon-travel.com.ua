_REDIRECTSSL_

_REDIRECT_

server {
    server_name _DOMAIN_;

	_LOGS_

	_CERTS_

	include /etc/nginx/snippets/includes.conf;

    location / {
        return 301 https://visasupport.kiev.ua;
    }
}
