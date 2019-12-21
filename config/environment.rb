require 'bundler/setup'
Bundler.require 

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

ENV['ETERNIA_DEV'] ||= 'development'

DBRegistry[ENV['ETERNIA_DEV']].connect!
DB = ActiveRecord::Base.connection

def drop_db
  DB.tables.each do |table|
    DB.execute('DROP TABLE #{table}')
  end 
end 