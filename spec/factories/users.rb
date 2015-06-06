FactoryGirl.define do
  
  factory :user do
    agency      { FactoryGirl.create(:agency) }
    email       { Faker::Internet.email }
    username    { Faker::Internet.user_name }
    password    'Password1'
  end
  
  factory :admin, parent: :user do
    roles [:admin]
  end
  
  factory :requester, parent: :user do
    roles [:requester]
    customer { FactoryGirl.create(:customer) }
  end
  
  
  factory :consumer, parent: :user do
    roles [:consumer]
    last_name   { Faker::Name.last_name }
    first_name  { Faker::Name.first_name }
    middle_name { [Faker::Name.first_name,nil,nil,'J','A','P'].sample }
    prefix      { [Faker::Name.prefix,nil,nil].sample }
    address     { FactoryGirl.create(:address) }
    phones      { [FactoryGirl.create(:phone)] }
  end
  
  factory :interpreter, parent: :user do
    roles [:interpreter]
    default_payrate { Faker::Number.between(3000,9900) }
  end

end
