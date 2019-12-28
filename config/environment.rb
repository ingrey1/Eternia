require "bundler/setup"
require "sinatra/activerecord"
require "ostruct"
require "date"
require "rake"
require "concurrent"
require 'require_all'
require_all 'app/models'

Bundler.require 


connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)