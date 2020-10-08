class Platform < ApplicationRecord
  has_many :game_platforms, dependent: :destroy
  has_many :game_publishers, through: :game_platforms
end
