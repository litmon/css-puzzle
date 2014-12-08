class CreateSelectors < ActiveRecord::Migration
  def change
    create_table :selectors do |t|
      t.integer :style_id
      t.string :name
      t.integer :property_id

      t.timestamps
    end
  end
end
