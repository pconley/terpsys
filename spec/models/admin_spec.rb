require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has a factory' do
    admin = FactoryGirl.create(:admin)
    expect(admin).to be_valid
  end
  it 'requires a username' do
    admin = FactoryGirl.build(:admin, username: nil)
    expect(admin).not_to be_valid
  end
  it 'requires an email' do
    admin = FactoryGirl.build(:admin, email: nil)
    expect(admin).not_to be_valid
  end
  it 'has the admin role' do
    admin = FactoryGirl.build(:admin)
    expect(admin.roles).to eq([:admin])
  end
  
end
