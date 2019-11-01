set -ex

SHA=$(git rev-parse --short HEAD)
PROJECT_ID=$(gcloud config get-value project)
RAILS_MASTER_KEY=$(cat web_container/config/master.key)

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t eu.gcr.io/${PROJECT_ID}/masajid:latest \
  -t eu.gcr.io/${PROJECT_ID}/masajid:${SHA} .

docker push eu.gcr.io/${PROJECT_ID}/masajid:${SHA}
docker push eu.gcr.io/${PROJECT_ID}/masajid:latest

kubectl set image deployment/masajid-deployment masajid=eu.gcr.io/${PROJECT_ID}/masajid:${SHA}
