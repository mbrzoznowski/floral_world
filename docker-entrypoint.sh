#!/bin/bash
set -e

if [[ -n "$APP_BUNDLE_INSTALL" ]]; then
  if [ "$RAILS_ENV" = "development" ]; then
    bundle config --delete without
    bundle install --jobs 20 --retry 5
  else
    bundle install --jobs 20 --retry 5 --without development test
  fi
fi

if [[ -n "$APP_DB_CREATE" ]]; then
  rails db:create
fi

if [[ -n "$APP_DB_MIGRATE" ]]; then
  rails db:migrate
fi

if [[ -n "$APP_DB_SEED" ]]; then
  rails db:seed
fi


rm -f /tmp/server.pid

exec "$@"
