class Character < ActiveRecord::Base
  belongs_to :game
  has_one :game_class
  #has_one :inventory
  #has_one :class
  #has_many :items, through: :inventory
  #has_many :items, through: :equipment
  

end
