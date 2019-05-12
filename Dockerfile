FROM ruby:2.6.3

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
COPY engines ./engines
RUN bundle install
COPY . .

CMD bundle exec rails s -p 3000 -b '0.0.0.0'
