require "rake"
require "pry"

require_relative "../config/environment.rb"

rake = Rake::Application.new
Rake.application = rake
rake.init
rake.load_rakefile

describe Game do
  before(:each) do
    Rake::Task["db:migrate"].invoke({ VERSION: 0 })
    #Rake::Task["db:migrate"].invoke

  end

  it("create method should save to db without error") do
    game1 = Game.create(name: "game1")
    expect(Game.all[0]).to eq(game1)
  end
end
