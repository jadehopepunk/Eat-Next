require "rubygems"
require "bundler/setup"

require 'lib/eat_this_week_data_source'
require 'lib/console_data_renderer'
require 'active_record'
require 'yaml'

require 'lib/date_helpers'

# Connect to Database
dbconfig = YAML::load(File.open('db/config.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

require 'lib/models/food_category'
require 'lib/models/food_batch_group'
require 'lib/models/food_batch'
require 'lib/food_amount'