# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  puzzle_id   :integer
#  state       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Style < ActiveRecord::Base
  belongs_to :puzzle
  has_many :selectors, dependent: :destroy
  accepts_nested_attributes_for :selectors

  validates :state, presence: true

  enum state: %i(init goal)
end
