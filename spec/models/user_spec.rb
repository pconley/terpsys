require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'interpreter' do
    it 'has a factory' do
      user = FactoryGirl.create(:interpreter)
      expect(user).to be_valid
    end
    it 'requires a username' do
      user = FactoryGirl.build(:interpreter, username: nil)
      expect(user).not_to be_valid
    end
    it 'requires an email' do
      user = FactoryGirl.build(:interpreter, email: nil)
      expect(user).not_to be_valid
    end
  end
  
end
