class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :pub_name

      t.timestamps
    end
  end
end
