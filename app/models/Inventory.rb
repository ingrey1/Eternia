class Inventory < ActiveRecord::Base
    belongs_to :character
    belongs_to :monster
    has_many :items

end 