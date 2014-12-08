# == Schema Information
#
# Table name: selectors
#
#  id          :integer          not null, primary key
#  style_id    :integer
#  name        :string(255)
#  property_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Selector < ActiveRecord::Base
  belongs_to :style
  has_many :properties
  accepts_nested_attributes_for :properties

  validates :name, presence: true
end
