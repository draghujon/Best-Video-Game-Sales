class Game < ApplicationRecord
  belongs_to :genre
  has_many :game_publishers, dependent: :destroy
  has_many :publishers, through: :game_publishers
  has_many :game_platforms, through: :game_publishers
  has_many :region_sales, through: :game_platforms
  # def self.ordered_by_games
  #   self.select("games.*")
  #       .select("game_id.id) as game_count")
  #       .left_joins(:genre)
  #       .group("game_id.id")
  #       .order("game_count DESC")
  # end
end
