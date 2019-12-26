class Zone < ActiveRecord::Base
    belongs_to :game
    has_many :monsters
    has_one :character
    

end 