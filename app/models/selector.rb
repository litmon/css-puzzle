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
end
