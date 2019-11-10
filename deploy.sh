set -ex

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA} .

gcloud docker -- push eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA}
gcloud docker -- push eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest

kubectl set image deployment/masajid-frontend masajid-frontend=eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA} --record
kubectl set image deployment/masajid-sidekiq masajid-sidekiq=eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA} --record
