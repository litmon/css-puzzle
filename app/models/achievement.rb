class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :puzzle

  enum result: %i(fail success)
end
