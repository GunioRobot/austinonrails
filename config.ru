# This file is used by Rack-based servers to start the application.
if (ENV['RACK_ENV']) == 'production'
  ENV['GEM_HOME'] = "#{ENV['HOME']}/.gems"
  ENV['GEM_PATH'] = "#{ENV['HOME']}/.gems:/usr/lib/ruby/gems/1.8"
  require 'rubygems'
  Gem.clear_paths
end

require ::File.expand_path('../config/environment',  __FILE__)
run Austinonrails::Application
