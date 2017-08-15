FactoryGirl.define do
  factory :regatta do
    name        Faker::Coffee.variety
    start_date  Date.today
    end_date    Faker::Date.forward(20)
  end
end
