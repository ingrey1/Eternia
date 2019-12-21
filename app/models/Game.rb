class Game < ActiveRecord::Base
  has_one :user, dependent: :destroy
end 