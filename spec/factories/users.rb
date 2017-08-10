FactoryGirl.define do
  factory :user do
    first_name    Faker::Name.first_name
    last_name     Faker::Name.last_name
    email         Faker::Internet.email
    phone_number  Faker::PhoneNumber.cell_phone
    weight        Faker::Number.between(85, 250)
  end
end
