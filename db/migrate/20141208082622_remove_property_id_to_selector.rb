class RemovePropertyIdToSelector < ActiveRecord::Migration
  def change
    remove_column :selectors, :property_id
  end
end
