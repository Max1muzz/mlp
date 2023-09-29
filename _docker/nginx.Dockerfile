FROM nginx:latest

ADD ./_docker/nginx/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www