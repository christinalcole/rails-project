FactoryGirl.define do
  factory :race do
    date  Faker::Date.forward(50)
  end
end
