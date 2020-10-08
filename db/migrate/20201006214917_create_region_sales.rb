class CreateRegionSales < ActiveRecord::Migration[6.0]
  def change
    create_table :region_sales do |t|
      t.string :num_sales
      t.references :region, null: false, foreign_key: true
      t.references :game_platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
