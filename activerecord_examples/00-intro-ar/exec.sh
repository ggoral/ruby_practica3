#!/bin/bash

if [ ! -e /tmp/sample.db ]; then
  sqlite3 /tmp/sample.db < query.sql 
fi
bundle exec ruby main.rb
