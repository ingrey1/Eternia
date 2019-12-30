
class Monster < ActiveRecord::Base
  belongs_to :zone
  has_one :inventory
  has_many :encounters

  def lose_health(damage)
    self.current_health = self.current_health - damage
  end

  def set_gold
    self.gold = 1 + self.level * rand(5)
  end

  def set_exp
    self.experience = self.level * 5 + rand(10)
  end

  def calculate_damage
    (1 + (self.strength / 5.0 * rand(5))).round(1)
  end

  def attack(player)
    dmg = self.calculate_damage
    player.lose_health(dmg)
    puts "#{self.name} attacks #{player.name} for #{dmg} points of damage\n"
  end
end
