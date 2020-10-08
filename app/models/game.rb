class Game < ApplicationRecord
  belongs_to :genre
  has_many :game_publishers, dependent: :destroy
  has_many :publishers, through: :game_publishers
end
