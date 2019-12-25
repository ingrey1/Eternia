require_relative "../config/environment.rb"

# create the model instances
new_game = Game.new(name: "Jason's game")
jason_user = User.new(name: "Jason")
zaross_character = Character.new(name: "zaross")

# associate the instances
new_game.user = jason_user
jason_user.games << new_game
new_game.character = zaross_character
zaross_character.game = new_game

binding.pry