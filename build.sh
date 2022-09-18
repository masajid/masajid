set -ex

export RAILS_MASTER_KEY=$(cat web_container/config/credentials/production.key)
export SHA=$(git rev-parse --short HEAD)

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t masajidworld/masajid:latest \
  -t masajidworld/masajid:${SHA} .

docker push masajidworld/masajid:latest
docker push masajidworld/masajid:${SHA}
