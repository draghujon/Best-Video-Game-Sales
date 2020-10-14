class CreateGamePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_publishers do |t|
      t.references :game, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
