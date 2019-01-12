# README

### Setup

```
# git clone .../theopenmasjid.git & cd theopenmasjid
# bundle install
# rails db:create db:migrate db:seed
# rails content_places:import
```

other steps:

- rename `config/application.yml.example` to `config/application.yml` and change the environment variables.

### Deployment to heroku

```
# heroku login
# heroku create
# heroku ps:scale web=1
# heroku ps
# heroku run rails db:migrate
# heroku run rails db:seed
# heroku run rails content_places:import
# heroku open
# heroko logs --tail
```
