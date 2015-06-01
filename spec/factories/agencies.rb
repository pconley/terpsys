FactoryGirl.define do
  factory :agency do
    agency_name { Faker::Company.name }
    passcode    { Faker::Number.number(4) }
  end
end
