FROM nginx

RUN apt-get update -yqq \
  && apt-get install -yqq vim curl \
    certbot \
    python-certbot-nginx

# To run inside container, manually for now
RUN certbot certonly --nginx --agree-tos --no-eff-email --email admin@masajid.world -d masajid.world

COPY nginx.conf /etc/nginx/nginx.conf
