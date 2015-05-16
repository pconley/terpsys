FactoryGirl.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    password 'Password1'
  end

end
