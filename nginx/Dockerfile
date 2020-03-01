FROM nginx

RUN apt-get update -yqq \
  && apt-get install -yqq vim curl \
    certbot \
    python-certbot-nginx

# To run inside container, manually for now
# RUN certbot certonly --nginx --agree-tos --no-eff-email --email admin@masajid.world -d masajid.world
RUN certbot \
  --server https://acme-v02.api.letsencrypt.org/directory \
  -d *.masajid.world -d masajid.world \
  --manual \
  --preferred-challenges dns-01 certonly

COPY nginx.conf /etc/nginx/nginx.conf
