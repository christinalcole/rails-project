FactoryBot.define do
  factory :race do
    association :regatta, factory: :regatta, strategy: :build
    date  Faker::Date.forward(50)
  end
end
