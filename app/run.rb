require_relative "../config/environment.rb"

# create the model instances
new_game = Game.create(name: "Jason's game")

dark_forest = Zone.create(name: "Dark Forest")

jason_user = User.create(name: "Jason")

kobold1 = Monster.create({
  name: "kobold1",
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
  gold: 0
})
kobold1.set_exp
kobold1.set_gold


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
  gold: 0
}

zaross = Character.create(zaross_start_data)

# # associate the instances
jason_user.games << new_game

new_game.user = jason_user
new_game.character = zaross
new_game.zones << dark_forest

dark_forest.game = new_game
dark_forest.character = zaross
dark_forest.monsters << kobold1

zaross.game = new_game
zaross.zone = dark_forest

kobold1.zone = dark_forest

encounter1 = Encounter.create
encounter1.character = zaross
encounter1.monster = kobold1
encounter1.fight

#binding.pry
