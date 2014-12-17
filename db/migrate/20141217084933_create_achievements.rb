class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.integer :puzzle_id
      t.integer :result

      t.timestamps
    end
  end
end
