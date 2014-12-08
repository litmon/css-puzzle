class ChangeColumnsToPuzzle < ActiveRecord::Migration
  def change
    add_column :puzzles, :style_id, :integer
    remove_column :puzzles, :property_id
  end
end
