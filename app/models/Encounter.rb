class Encounter < ActiveRecord::Base
  belongs_to :character
  belongs_to :monster

  def fight
    puts "#{self.character.name} has encountered hostile #{self.monster.name}\n"

    puts "Let the fight begin!\n"

    character_delay = 3 - (self.character.dexterity / 10.0)
    monster_delay = 3 - (self.character.dexterity / 10.0)

    until self.character.current_health <= 0 || self.monster.current_health <= 0
      self.character.attack(self.monster)
      sleep character_delay
      self.monster.attack(self.character)
      sleep monster_delay
    end

    if self.character.current_health > 0
      self.character_win = true
      puts "#{self.character.name} has slain #{self.monster.name}!"
      self.character.gain_experience(self.monster)
    else
      puts "You have died. Game Over"
      self.character.game.status = "game over"
      self.character.game.end_game
    end
  end
end
