FactoryGirl.define do
  factory :company do
    name          { Faker::Company.name }
    contact_name  { Faker::Name.name }
    contact_email { Faker::Internet.email }
    contact_phone { Faker::PhoneNumber.phone_number }
    
    address1  { Faker::Address.street_address }
    # address2      "MyString"
    city      { Faker::Address.city }
    state     { Faker::Address.state }
    zip       { Faker::Address.zip }
    # f.answer   { "A"+Faker::Number.number(4) }
    
  end
end
