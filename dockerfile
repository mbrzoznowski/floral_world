FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential sqlite3 libpq-dev nodejs
WORKDIR /floral_world
ADD Gemfile /floral_world/Gemfile
ADD Gemfile.lock /floral_world/Gemfile.lock
RUN bundle install
ADD . /floral_world
