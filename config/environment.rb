require "bundler/setup"
require "pry"
Bundler.require

Dir.entries("app/models").select { |file_name| file_name.last(3) == ".rb" }.each { |f| require_relative "../app/models/" + f }
Dir.entries("lib/support").select { |file_name| file_name.last(3) == ".rb" }.each { |f| require_relative "../lib/support/" + f }

ENV["ETERNIA_DEV"] ||= "development"

DBRegistry[ENV["ETERNIA_DEV"]].connect!
DB = ActiveRecord::Base.connection

def drop_db
  DB.tables.each do |table|
    DB.execute('DROP TABLE ' + table )
  end
end
