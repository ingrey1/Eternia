class Equipment < ActiveRecord::Base
   belongs_to :character
   has_many :items


end 