class Genre < ApplicationRecord
  has_many :games, dependent: :destroy

  # def self.ordered_by_games
  #   self.select("genres.*")
  #       .select("genres_id.id) as game_count")
  #       .left_joins(:games)
  #       .group("genres_id.id")
  #       .order("game_count DESC")
  # end
end
