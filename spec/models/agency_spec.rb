require 'rails_helper'

RSpec.describe Agency, type: :model do
  
  it 'has a factory' do
    agency = FactoryGirl.create(:agency)
    # puts "+++ customer = #{customer.inspect}"
    # puts "+++ address = #{customer.address.inspect}"
    expect(agency).to be_valid
  end
  it 'requires a name' do
    agency = FactoryGirl.build(:agency, agency_name: nil)
    expect(agency).not_to be_valid
  end
  it 'requires a passcode' do
    agency = FactoryGirl.build(:agency, passcode: nil)
    expect(agency).not_to be_valid
  end
  
end
