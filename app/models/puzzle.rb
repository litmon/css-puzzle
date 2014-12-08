# == Schema Information
#
# Table name: puzzles
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  description :text
#  style_id    :integer
#

class Puzzle < ActiveRecord::Base
  has_many :styles
  accepts_nested_attributes_for :styles

  validates :title, uniqueness: true
end
