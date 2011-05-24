#!/usr/bin/env ruby
require 'lib/setup_env'

# Seed with some sensible development data
# require 'lib/development_fixtures'

# Render Data source output to the console
data_source = EatThisWeekDataSource.new
renderer = ConsoleDataRenderer.new(data_source)
renderer.render
