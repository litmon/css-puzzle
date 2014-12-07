class AddDataToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :name, :string
    add_column :properties, :value, :string
  end
end
