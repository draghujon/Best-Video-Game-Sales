class RegionSale < ApplicationRecord
  belongs_to :region
  belongs_to :game_platform
end
