class RegionSale < ApplicationRecord
  belongs_to :regions
  belongs_to :game_platforms
end
