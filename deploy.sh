set -ex

openssl aes-256-cbc -K $encrypted_01c4308a40f4_key -iv $encrypted_01c4308a40f4_iv -in service-account.json.enc -out service-account.json -d
curl https://sdk.cloud.google.com | bash > /dev/null;
source $HOME/google-cloud-sdk/path.bash.inc
gcloud components update kubectl
gcloud auth activate-service-account --key-file service-account.json
gcloud config set project ${GKE_PROJECT_ID}
gcloud config set compute/zone ${GKE_ZONE}
gcloud container clusters get-credentials ${GKE_CLUSTER}

docker build \
  -f Dockerfile.prod \
  --build-arg="RAILS_MASTER_KEY=${RAILS_MASTER_KEY}" \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest \
  -t eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA} .

docker push eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA}
docker push eu.gcr.io/${GKE_PROJECT_ID}/masajid:latest

kubectl set image deployment/masajid-frontend masajid=eu.gcr.io/${GKE_PROJECT_ID}/masajid:${SHA}
