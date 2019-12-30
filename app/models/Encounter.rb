class Encounter < ActiveRecord::Base
  belongs_to :character
  belongs_to :monster

  def fight_over?
    self.character.current_health <= 0 || self.monster.current_health <= 0
  end

  def fight
    puts "\n#{self.character.name} has encountered hostile #{self.monster.name}\n\n"

    puts "\nLet the fight begin!\n\n"

    character_delay = 3 - (self.character.dexterity / 10.0)
    monster_delay = 3 - (self.character.dexterity / 10.0)

    until fight_over?
      player_attack = self.character.attack(self.monster, false)

      if player_attack == "auto attack"
        # timer attacks

        p_timer = Concurrent::TimerTask.new(execution_interval: character_delay, timeout_interval: character_delay) do |task|
          self.character.attack(self.monster, true)
        end

        m_timer = Concurrent::TimerTask.new(execution_interval: monster_delay, timeout_interval: monster_delay) do |task|
          self.monster.attack(self.character)
        end
        p_timer.execute
        m_timer.execute
        until fight_over?
          # wait till fight is over to shut down timers
        end
        p_timer.shutdown
        m_timer.shutdown
      else
        sleep 1
        self.monster.attack(self.character)
      end
    end

    if self.character.current_health > 0
      self.character_win = true
      puts "#{self.character.name} has slain #{self.monster.name}!"
      self.character.gain_experience(self.monster)
      self.character.loot_gold(self.monster)
    else
      puts "You have died. Game Over"
      self.character.game.status = "game over"
      self.character.game.end_game
    end
  end
end
