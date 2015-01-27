
FactoryGirl.define do
  factory :puzzle do
    sequence(:title) {|n| "puzzle-#{n}"}
    description: "This is the sample puzzle."
    html: "<div><p>This is the sample text.</p></div>"
  end
end
