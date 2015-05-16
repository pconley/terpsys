require 'rails_helper'

RSpec.describe Company, type: :model do
  
  it 'has a factory' do
    company = FactoryGirl.create(:company)
    expect(company).to be_valid
  end
  it 'requires a name' do
    company = FactoryGirl.build(:company, name: nil)
    expect(company).not_to be_valid
  end
  it 'requires a contact email' do
    company = FactoryGirl.build(:company, contact_email: nil)
    expect(company).not_to be_valid
  end
  
end
