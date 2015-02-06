class AddClearTimeToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :time, :integer
  end
end
