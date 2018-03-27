require 'faker'

FactoryBot.define do
  factory :boat do
    association :owner, factory: :user, strategy: :build
    name    Faker::Ancient.god
    make    Faker::Ancient.titan
    length  Faker::Number.number(2)
    rating  Faker::Number.between(-100, 100)
  end
end
