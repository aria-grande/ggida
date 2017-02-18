#!/usr/bin/env bash
git pull origin master
rails db:migrate

kill -9 $(cat tmp/pids/server.pid)
rails server -d -b 0.0.0.0