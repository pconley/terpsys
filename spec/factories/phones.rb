FactoryGirl.define do
  factory :phone do
    phone_type { Faker::Lorem.word }
    number     { Faker::PhoneNumber.phone_number }
  end
end