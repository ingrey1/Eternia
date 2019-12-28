
class Monster < ActiveRecord::Base
  belongs_to :zone
  has_one :inventory
  has_many :encounters

  def lose_health(damage)
    self.current_health = self.current_health - damage 
 end 

  def calculate_damage
     1 + (self.strength / 5 * rand(5) )
  end 

  def attack(player)
    player.lose_health(self.calculate_damage)
  end
end
