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
#  user_id     :integer
#

class Puzzle < ActiveRecord::Base
  belongs_to :user
  has_many :styles, dependent: :destroy
  has_many :achievements, dependent: :destroy

  accepts_nested_attributes_for :styles, limit: 2

  validates :html, presence: true
  validates :title, uniqueness: true

  def init
    find_style(:init)
  end

  def goal
    find_style(:goal)
  end

  private

  def find_style(state)
    self.styles.find_by(state: state)
  end
end
