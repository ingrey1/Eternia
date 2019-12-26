require_relative "../config/environment.rb"

# create the model instances
new_game = Game.create(name: "Jason's game")

jason_user = User.create(name: "Jason")

zaross_start_data = {
  name: "zaross",
  level: 1,
  experience: 0,
  current_health: 10,
  max_health: 10,
  current_mana: 10,
  max_mana: 10,
  strength: 1,
  dexterity: 1,
  wisdom: 1,
  constitution: 1,
  intelligence: 1,
  charisma: 1,
}

zaross = Character.create(zaross_start_data)

# # associate the instances
new_game.user = jason_user
jason_user.games << new_game
new_game.character = zaross
zaross.game = new_game

binding.pry
