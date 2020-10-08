class GamePlatform < ApplicationRecord
  belongs_to :game_publishers
  belongs_to :platforms
  has_many :region_sales, dependent: :destroy
  has_many :regions, through: :region_sales
end
