class Zone < ActiveRecord::Base
    belongs_to :game
    has_many :monsters
    

end 