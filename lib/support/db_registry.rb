require 'ostruct'
require_relative './connection_adapter.rb'
DBRegistry ||= OpenStruct.new(
    test: ConnectionAdapter.new('db/eternia-test.db'),
    development: ConnectionAdapter.new('db/eternia.db') 
)