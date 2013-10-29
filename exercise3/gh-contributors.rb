#!/usr/bin/env ruby
# coding: utf-8


require 'octokit'

user = Octokit.user 'ggoral'
puts user.name

repo = Octokit.repo 'TTPS-ruby/capacitacion-ruby-ttps'
puts repo.rels[:contributors].get.data

