FactoryGirl.define do
  factory :phone do
    phone_type 'primary'
    number     { Faker::PhoneNumber.phone_number }
  end
end