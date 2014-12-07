class AddDataToPuzzle < ActiveRecord::Migration
  def change
    add_column :puzzles, :title, :string
    add_column :puzzles, :description, :text
    add_column :puzzles, :property_id, :integer
  end
end
