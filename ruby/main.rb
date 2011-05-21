#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"

require 'lib/eat_this_week_data_source'
require 'lib/console_data_renderer'
require 'active_record'
require 'yaml'

dbconfig = YAML::load(File.open('db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

data_source = EatThisWeekDataSource.new
renderer = ConsoleDataRenderer.new(data_source)
renderer.render
