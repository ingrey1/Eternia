class Game < ActiveRecord::Base
  belongs_to :user
  has_one :character, dependent: :destroy
  has_many :zones
end
