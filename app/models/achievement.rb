# == Schema Information
#
# Table name: achievements
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  puzzle_id  :integer
#  result     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :puzzle

  enum result: %i(fail success)
end
