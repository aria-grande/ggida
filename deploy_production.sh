#!/usr/bin/env bash
git pull origin master
bundle install
rails db:migrate

kill -9 $(cat tmp/pids/server.pid)
rails server -d -b 0.0.0.0