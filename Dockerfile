FROM ruby:2.6.3

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

RUN mkdir -p /app/web_container
WORKDIR /app/web_container

COPY web_container/Gemfile* ./
COPY engines ../engines

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV}

RUN bundle install --binstubs

COPY web_container .

RUN mkdir -p tmp/pids

CMD puma -C config/puma.rb
