class AddHtmlToPuzzle < ActiveRecord::Migration
  def change
    add_column :puzzles, :html, :text
  end
end
