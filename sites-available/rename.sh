set -e

mv /etc/nginx/sites-available/$1 /etc/nginx/sites-available/$2
rm /etc/nginx/sites-enabled/$1
ln -s /etc/nginx/sites-available/$2 /etc/nginx/sites-enabled/$2
