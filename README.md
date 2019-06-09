# README

### Setup

```
# git clone .../theopenmasjid.git & cd theopenmasjid
# bundle install
# rails db:create db:migrate db:seed
# rails content_places:import [only=countries,regions,cities]
```

other steps:

- rename `config/application.yml.example` to `config/application.yml` and change the environment variables.

### Deployment to heroku

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

# heroku apps:rename theopenmasjid
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

- `beta_v2`: enable beta version 2 which must be release by the end of 2019

From the browser, as a super admin member of the technology team, you can access the flipper UI through `/flipper`
