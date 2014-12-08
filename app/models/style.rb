# == Schema Information
#
# Table name: styles
#
#  id          :integer          not null, primary key
#  puzzle_id   :integer
#  state       :integer
#  selector_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Style < ActiveRecord::Base
end
