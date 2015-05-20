FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email    { Faker::Internet.email }
    password 'Password1'
  end
  factory :admin, parent: :user do
    roles [:admin]
  end
end
