require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has a factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end
  it 'requires a username' do
    user = FactoryGirl.build(:user, username: nil)
    expect(user).not_to be_valid
  end
  it 'requires an email' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end
  
end
