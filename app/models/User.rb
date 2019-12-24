class User < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :characters, through: :games 
end
