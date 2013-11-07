#!/usr/bin/env ruby
# coding: utf-8


require 'octokit'

user = Octokit.user 'ggoral'
puts user.name

repo = Octokit.repo 'TTPS-ruby/capacitacion-ruby-ttps'
array = repo.rels[:contributors].get.data
array.each do |sawyer| 
  login = sawyer.to_hash[:login]
  contributions = sawyer.to_hash[:contributions]
  puts "* #{login} (#{contributions})"
end
