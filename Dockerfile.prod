FROM ruby:2.6.3

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
    yarn \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

RUN mkdir -p /app/web_container
WORKDIR /app/web_container

COPY web_container/Gemfile* ./
COPY engines ../engines

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV}
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

RUN bundle install --binstubs

COPY web_container .

RUN mkdir -p tmp/pids

RUN rails assets:precompile

CMD puma -C config/puma.rb
