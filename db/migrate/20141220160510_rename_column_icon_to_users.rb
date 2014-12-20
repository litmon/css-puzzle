class RenameColumnIconToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :icon, :image
  end
end
