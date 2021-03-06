class GamePlatform < ApplicationRecord
  belongs_to :game_publisher
  belongs_to :platform
  has_many :region_sales, dependent: :destroy
  has_many :regions, through: :region_sales

  validates :release_year, numericality: { only_integer: true }
end
