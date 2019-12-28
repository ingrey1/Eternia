
class Monster < ActiveRecord::Base
  belongs_to :zone
  has_one :inventory
  has_many :encounters

  def attack(player)
  end
end
