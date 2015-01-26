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

require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
