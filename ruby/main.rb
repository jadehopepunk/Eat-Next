#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"

require 'lib/eat_this_week_data_source'
require 'lib/console_data_renderer'
require 'active_record'
require 'yaml'

require 'lib/models/food_category'
require 'lib/models/food_batch'

# Connect to Database
dbconfig = YAML::load(File.open('db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

# Seed with some sensible development data
require 'lib/development_fixtures'

# Render Data source output to the console
data_source = EatThisWeekDataSource.new
renderer = ConsoleDataRenderer.new(data_source)
renderer.render
