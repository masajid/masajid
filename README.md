# README

Masajid is a non-profit project dedicated to mosques that are willing to create their own website.

Website: https://masajid.world

## Requirements

- Postgres 11
- Redis and Sidekiq
- Ruby 2.7.6 (RVM is recommended)

## Setup

```
$ git clone git@github.com:mgharbik/masajid.git
$ cd masajid/web_container
$ touch config/credentials/production.key # then copy/past the master key
$ bundle install
$ rails db:create db:migrate db:seed
$ rails content_places:import only=countries
$ rails s
```

#### Setup with Docker Compose

First rename `.env.example` to `.env` and change the database environment variables.

```
$ brew install libpq
$ gem install pg -- --with-opt-dir=/usr/local/opt/libpq

$ docker-compose up -d db redis
```

other steps:

- add to `/etc/hosts` file

```
127.0.0.1       masajid.local
127.0.0.1       al-nour.masajid.local
```

- visit [http://masajid.local:3000/admin](http://masajid.local:3000/admin), credentials: `admin@masajid.world`/`masajid`
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
