class Encounter < ActiveRecord::Base

    has_one :character
    has_one :monster

end 