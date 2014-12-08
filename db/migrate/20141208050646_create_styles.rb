class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.integer :puzzle_id
      t.integer :state
      t.integer :selector_id

      t.timestamps
    end
  end
end
