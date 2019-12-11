set -ex

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:latest \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:${SHA} .

docker push -- eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:${SHA}
docker push -- eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:latest

kubectl set image deployment/masajid-frontend masajid-frontend=eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:${SHA} --record
kubectl set image deployment/masajid-sidekiq masajid-frontend=eu.gcr.io/${GKE_PROJECT_ID}/masajid-frontend:${SHA} --record
