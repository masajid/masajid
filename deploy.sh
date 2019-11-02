set -ex

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA} .

docker push eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA}
docker push eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest

kubectl set image deployment/masajid-frontend masajid=eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA}
