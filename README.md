# NGINX 

## How add to swarm

Make sure that overlay network is created

```
docker network create \
	--driver overlay \
	--attachable \
	internal-network
```

Deploy the service

```
docker service create \
	--name nginx \
	--publish 80:80 \
	--publish 443:443 \
	--mount type=bind,source=/etc/letsencrypt/,target=/etc/letsencrypt/,readonly \
	--mount type=bind,source=/etc/ssl/certs/dhparam.pem,target=/etc/ssl/certs/dhparam.pem,readonly \
	--constraint 'node.role == manager' \
	--network internal-network \
	registry.dbogatov.org/dbogatov/nginx-config:latest
```
