class User < ActiveRecord::Base

    has_many :game, dependent: :destroy
    

end 