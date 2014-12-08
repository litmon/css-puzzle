class AddSelectorIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :selector_id, :integer
  end
end
