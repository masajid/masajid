set -ex

APP_NAME=$(cat name)
VERSION=$(cat version)
RAILS_MASTER_KEY=$(cat web_container/config/master.key)

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t ${APP_NAME}:${VERSION} .
