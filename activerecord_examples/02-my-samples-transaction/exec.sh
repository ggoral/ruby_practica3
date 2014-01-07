#!/bin/bash

if [ ! -e /tmp/transaction.db ]; then
  sqlite3 /tmp/transaction.db < transaction.sql 
fi
bundle exec ruby main.rb
