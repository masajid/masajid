# README

Masajid is a non-profit project dedicated to mosques that are willing to create their own website.

Website: https://masajid.world

## Requirements

- Postgres
- Redis and Sidekiq
- Ruby 2.5.0 or newer (RVM is recommended)

## Setup

```
$ git clone git@github.com:mgharbik/masajid.git
$ cd masajid/web_container
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

- visit [http://masajid.local:3000/admin](http://masajid.local:3000/admin), credentials: `admin@masajid.com`/`masajid`
- also visit [http://al-nour.masajid.local:3000](http://al-nour.masajid.local:3000)
- You can list the sent emails here [http://localhost:3000/letter_opener/](http://localhost:3000/letter_opener)
## Translations

- Add or update translations, then sync:

```
$ rails translation:sync
```

- For more options please visit [https://github.com/translation/rails#usage](https://github.com/translation/rails#usage)

- Translators should login to [https://translation.io](https://translation.io/)

## Emails

- https://www.mailjet.com
- free forever: 6000 emails per months / 200 per day

##### Previews
- Please add previews to `engines/content/lib/mailer_previews` folder
- [http://localhost:3000/rails/mailers](http://localhost:3000/rails/mailers)

## Deployment

### Digital Ocean

Setup droplet using docker-machine:

```
$ docker-machine create \
  --driver=digitalocean \
   --digitalocean-access-token=$DO_TOKEN \
   --digitalocean-size=1gb \
   masajid

# Or if the droplet already exists
$ docker-machine create \
  --driver=digitalocean \
  --generic-ip-address=<DROPLET_IP_ADDR> \
  --generic-ssh-user root \
  --generic-ssh-key ~/.ssh/id_rsa \
  masajid

$ docker-machine ssh masajid

$ docker-machine env masajid
$ eval $(docker-machine env masajid)

$ docker ps

$ docker-compose --file=docker-compose.prod.yml up -d db
$ docker-compose --file=docker-compose.prod.yml build app
$ docker-compose --file=docker-compose.prod.yml run --rm app rake db:create db:migrate db:seed
$ docker-compose --file=docker-compose.prod.yml run --rm app rake content_places:import only=countries
$ docker-compose --file=docker-compose.prod.yml up -d app sidekiq cron_job nginx
```

Deploy new changes:

```
$ docker-compose --file=docker-compose.prod.yml build app
$ docker-compose --file=docker-compose.prod.yml up --no-deps -d app sidekiq cron_job
$ docker-compose --file=docker-compose.prod.yml run --rm app rake db:migrate
```

Stop and remove droplet:

```
$ docker-machine stop masajid
$ docker-machine rm masajid
```

## Backups

Backup database:

```
$ docker exec <containerId> pg_dump -a -U masajid masajid > dump_masajid_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

Restore to localhost database:

```
$ psql -U postgres -d masajid_development < path-to-dump-file.sql
```

Backup uploads:

```
$ docker cp <containerId>:/app/web_container/storage ./web_container
```
