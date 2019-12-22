require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'


require 'bundler/setup'
Bundler.require


Dir.entries("app/models").select { |file_name| file_name.last(3) == ".rb" }.each { |f| require_relative "../app/models/" + f }

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/eternia.db"
)
