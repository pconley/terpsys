FactoryGirl.define do
  factory :customer do
    company_name    { Faker::Company.name }
    requester_name  { Faker::Name.name }
    requester_email { Faker::Internet.email }
    billing_email { Faker::Internet.email }
    billing_rate  { Faker::Number.number(4) }
    address { FactoryGirl.create(:address) }
  end
end
