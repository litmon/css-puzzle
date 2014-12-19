# == Schema Information
#
# Table name: puzzles
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  description :text
#  html        :text
#

class Puzzle < ActiveRecord::Base
  has_many :styles, dependent: :destroy
  has_many :achievement, dependent: :destroy
  accepts_nested_attributes_for :styles, limit: 2

  validates :title, uniqueness: true
  validates :html, presence: true
end
