# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
