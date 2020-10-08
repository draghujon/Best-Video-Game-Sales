class AddColumnToGamePlatform < ActiveRecord::Migration[6.0]
  def change
    add_column :games_platforms, :release_year, :integer
  end
end
