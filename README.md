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

- visit `http://masajid.local:3000/admin`, credentials: `admin@masajid.com`/`masajid`
- visit `http://al-nour.masajid.local:3000`

### Via docker

Make sure to have docker installed in your computer, then do following:

```
$ docker-compose up --build
$ docker-compose run --rm app rails db:setup
$ docker-compose run --rm app rails content_places:import only=countries

# More commands
$ docker-compose up -d db redis
$ docker-compose build app sidekiq
$ docker-compose up -d app sidekiq
$ docker-compose logs -f app
```

## Deployment

## Emails

- https://www.mailjet.com
- free forever: 6000 emails per months / 200 per day
