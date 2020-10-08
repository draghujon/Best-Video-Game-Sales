class GamePublisher < ApplicationRecord
  belongs_to :games
  belongs_to :publishers
  has_many :game_platforms, dependent: :destroy
  has_many :platforms, through: :game_platforms
end
