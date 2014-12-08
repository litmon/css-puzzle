class RemoveSelectorIdToStyles < ActiveRecord::Migration
  def change
    remove_column :styles, :selector_id
  end
end
