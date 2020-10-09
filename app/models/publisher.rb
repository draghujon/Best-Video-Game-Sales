class Publisher < ApplicationRecord
  has_many :game_publishers, dependent: :destroy
  has_many :games, through: :game_publishers

  validates :pub_name, presence: true
end
