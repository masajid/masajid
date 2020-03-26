FROM ruby:2.7.0

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && rm -rf /var/lib/apt/lists

WORKDIR /app/web_container

COPY web_container/Gemfile* ./
COPY engines ../engines

RUN bundle install

COPY web_container .

EXPOSE 3000
CMD rm -f tmp/pids/server.pid && rails s -b 0.0.0.0
