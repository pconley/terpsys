require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has a factory' do
    company = FactoryGirl.create(:user)
    expect(company).to be_valid
  end
  it 'requires a name' do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).not_to be_valid
  end
  it 'requires an email' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end
  
end
