FROM ruby:2.6.1

RUN apt-get update -qq && \
    apt-get install -qq --no-install-recommends build-essential libpq-dev mysql-client nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
