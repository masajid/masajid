set -ex

APP_NAME=$(cat name)
VERSION=$(cat version)
RAILS_MASTER_KEY=$(cat .rails_master_key)  # TODO: use secrets

echo $RAILS_MASTER_KEY

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_ENV=production" \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t ${APP_NAME}:${VERSION} .
