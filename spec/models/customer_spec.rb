require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  it 'has a factory' do
    customer = FactoryGirl.create(:customer)
    # puts "+++ customer = #{customer.inspect}"
    # puts "+++ address = #{customer.address.inspect}"
    expect(customer).to be_valid
  end
  it 'requires a name' do
    customer = FactoryGirl.build(:customer, company_name: nil)
    expect(customer).not_to be_valid
  end
  it 'requires a contact email' do
    customer = FactoryGirl.build(:customer, requester_email: nil)
    expect(customer).not_to be_valid
  end
  
end
