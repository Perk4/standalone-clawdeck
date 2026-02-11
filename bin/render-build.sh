#!/usr/bin/env bash
set -o errexit

bundle install

# Generate credentials if they don't exist
if [ ! -f config/credentials.yml.enc ]; then
  EDITOR="true" bundle exec rails credentials:edit
fi

bundle exec rails assets:precompile
bundle exec rails db:migrate
