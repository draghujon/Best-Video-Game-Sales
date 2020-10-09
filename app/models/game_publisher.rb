class GamePublisher < ApplicationRecord
  belongs_to :game
  belongs_to :publisher
  has_many :game_platforms, dependent: :destroy
  has_many :platforms, through: :game_platforms
end
