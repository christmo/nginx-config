FROM nginx:alpine

MAINTAINER Dmytro Bogatov dmytro@dbogatov.org

# Create a user
RUN adduser -D www-data

# Copy the source
COPY dist/ /etc/nginx

CMD ["nginx", "-g", "daemon off;"]
