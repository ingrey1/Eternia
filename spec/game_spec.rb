require "rake"
require "pry"

require_relative "../config/environment.rb"
require_relative "./load_rake.rb"

describe Game do
  before(:each) do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    
  end

  it("create method should save to db without error") do
    game1 = Game.create(name: "game1")
    expect(Game.all[0]).to eq(game1)
  end

  context "When testing for the existence of Game attributes" do

    game2 = Game.create(name: "game2")
   
    it("has an accessible name attribute") do
      
      expect { game2.name }.to_not raise_error
    end

    it("has an accessible user attribute") do
      
      expect { game2.user }.to_not raise_error

    end

    it("has an accessible character attribute") do
      
      expect { game2.character }.to_not raise_error
      
    end

    it("has an accessible zones attribute") do
      
      expect { game2.zones }.to_not raise_error
      
    end

  end
end
