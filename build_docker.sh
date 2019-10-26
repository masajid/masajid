set -ex

APP_NAME=$(cat name)
VERSION=$(cat version)
RAILS_MASTER_KEY=$(cat web_container/config/master.key)

echo $RAILS_MASTER_KEY

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_ENV=production" \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t ${APP_NAME}:${VERSION} .
