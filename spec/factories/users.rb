
require 'ffaker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    icon { Faker::Internet.icon }
  end
end
