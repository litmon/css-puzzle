# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  value       :string(255)
#  selector_id :integer
#

class Property < ActiveRecord::Base
  validates :name, :value, presence: true
end
