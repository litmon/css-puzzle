class RemoveStyleIdToPuzzles < ActiveRecord::Migration
  def change
    remove_column :puzzles, :style_id
  end
end
