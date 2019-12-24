class Equipment < ActiveRecord::Base
   belong_to :character
   has_many :items
   

end 