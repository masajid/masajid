# README

Masajid is a non-profit project dedicated to mosques that are willing to create their own website.

Visit https://masajid.world

## Requirements

- Postgres
- Redis and Sidekiq (Optional)
- Ruby 2.5.0 or newer (RVM is recommended)

## Setup

```
$ git clone git@github.com:mgharbik/masajid.git
$ cd masajid
$ bundle install
$ rails db:create db:migrate db:seed
$ rails content_places:import only=countries
$ rails s
```

other steps:

- rename `.env.example` to `.env` and change the environment variables.
- add to `/etc/hosts` file
```
127.0.0.1       masajid.local
127.0.0.1       al-nour.masajid.local
```

- visit `http://masajid.local:3000/admin`, credentials: admin@masajid.com/masajid
- visit `http://al-nour.masajid.local:3000`

## Deployment to gcloud

### Install gcloud SDK

https://cloud.google.com/sdk/install

### Init gcloud

After installing the SDK, start a new terminal to update the PATH variable. Then execut the folowing command:

```bash
$ gcloud init
```
Then copy `app.yaml.example` to `app.yaml` file and edit `app.yaml` to add the env variables and `cloud_sql_instances`

Finally, deploy the app:

```
gcloud app deploy app.yaml
```

## Setting Up a new project

### Create an SQL instance

```bash
gcloud sql instances create postgres-instance --database-version POSTGRES_9_6 --tier db-f1-micro
gcloud sql instances list
gcloud sql instances describe postgres-instance
gcloud sql users list --instance=postgres-instance
```
### Configure Cloud SQL

Edit file `config/database.yml` and add the following config:

```yml
production:
  adapter: postgresql
  encoding: unicode
  pool: 5
  timeout: 5000
  username: [YOUR_POSTGRES_USERNAME]
  password: [YOUR_POSTGRES_PASSWORD]
  database: [YOUR_POSTGRES_DATABASE]
  host: [YOUR_POSTGRES_HOST]
```
To get connection name: 

```
gcloud sql instances describe postgres-instance | grep connectionName
```
Then edit `app.yml` and add the cloud sql instance:

```yml
beta_settings:
  cloud_sql_instances: [YOUR_INSTANCE_CONNECTION_NAME]
```
Next, grant access to the cloudbuild service account to run production database migrations with the appengine gem.

```
gcloud projects add-iam-policy-binding [YOUR-PROJECT-ID] \
  --member=serviceAccount:[PROJECT_NUMBER]@cloudbuild.gserviceaccount.com \
  --role=roles/editor
```
To get the project id and number, run:
```
gcloud projects list
```

Enable Cloud SQL Admin API: https://console.cloud.google.com/apis/api/sqladmin.googleapis.com/overview

Migrate the Cloud SQL for PostgreSQL cat_list_production database in production.
```
bundle exec rake appengine:exec -- bundle exec rake db:migrate
```
Finally, direct traffic to your newly deployed version by using the following command:

```
gcloud app services set-traffic default --splits [YOUR-VERSION]=1
```
https://cloud.google.com/ruby/rails/using-cloudsql-postgres

### Set up Cloud SQL Proxy

```bash
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64
mv cloud_sql_proxy.linux.amd64 cloud_sql_proxy
chmod +x cloud_sql_proxy
sudo mkdir /cloudsql
sudo chmod 0777 /cloudsql
```

## Deployment to heroku

```
# heroku login
# heroku create
# git config --list | grep heroku
# git push heroku master

# heroku ps:scale web=1
# heroku ps

# heroku run rails db:migrate
# heroku run rails db:seed
# heroku run rails content_places:import

# heroku config:set ADMIN_SENDER_EMAIL=admin@gmail.com
# figaro heroku:set -e production (set all variables once)

# heroku apps:rename masajid
# heroku open

# heroko logs --tail
# heroku run rails console

# heroku addons:create redistogo:nano
# heroku config:set REDIS_PROVIDER=REDISTOGO_URL
# heroku config:set REDIS_URL=REDISTOGO_URL

# heroku apps:destroy (destroy the app)
```

### Emails

- https://www.mailjet.com
- free forever: 6000 emails per months / 200 per day


### Feature Flippers

#### From the Rails console

```ruby
> f = Content.flipper
> f.features.add(:signin_link) # add a feature
> f[:signin_link].enable # enable a feature
> f[:signin_link].disable # disable a feature
> f[:signin_link].enabled? # check if a feature is enabled
> Rails.cache.clear # in case a feature flipper affects a cached fragment
```

#### Used features

- `example`: description

From the browser, as a super admin member of the technology team, you can access the flipper UI through `/flipper`
