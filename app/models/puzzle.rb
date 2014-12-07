# == Schema Information
#
# Table name: puzzles
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  description :text
#  property_id :integer
#

class Puzzle < ActiveRecord::Base
end
