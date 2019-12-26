
class Monster < ActiveRecord::Base

    belongs_to :zone
    has_one :inventory

end 