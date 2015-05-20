FactoryGirl.define do
  factory :consumer do
    user { FactoryGirl.create(:user, roles: [:consumer]) }
    last_name    { Faker::Name.last_name }
    first_name   { Faker::Name.first_name }
    prefix       { Faker::Name.prefix }
    suffix       { Faker::Name.suffix }
    title        { Faker::Name.title }
    gender       { ['m','f'].sample }
    address { FactoryGirl.create(:address) }
    phones { [FactoryGirl.create(:phone)] }
  end
end

