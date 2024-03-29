FactoryGirl.define do
  factory :address do
    street1    { Faker::Address.street_address }
#   street2    { Faker::Address.street_address }
    city       { Faker::Address.city }
    state      { Faker::Address.state_abbr }
    zip        { Faker::Address.zip_code }
  end
end
