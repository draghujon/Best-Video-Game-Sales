class ChangeTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :games_publishers, :game_publishers
    rename_table :games_platforms, :game_platforms
  end
end
