FactoryGirl.define do
  factory :user do
    first_name    Faker::Name.first_name
    last_name     Faker::Name.last_name
    email         Faker::Internet.email
    phone_number  Faker::PhoneNumber.cell_phone
    weight        Faker::Number.between(85, 250)
    password      Faker::Internet.password(8)

    factory :user_with_positions do
      transient do
        positions_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:position, evaluator.positions_count, user: user)
      end
    end
  end
end
