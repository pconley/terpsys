require 'rails_helper'

RSpec.describe Consumer, type: :model do
  
  it 'has a factory' do
    consumer = FactoryGirl.create(:consumer)
    # puts "+++ consumer = #{consumer.inspect}"
    # puts "+++ address = #{consumer.address.inspect}"
    # puts "+++ phones = #{consumer.phones.inspect}"
    expect(consumer).to be_valid
  end
  # it 'requires a username' do
  #   consumer = FactoryGirl.build(:consumer, username: nil)
  #   expect(consumer).not_to be_valid
  # end
  # it 'requires an email' do
  #   consumer = FactoryGirl.build(:consumer, email: nil)
  #   expect(consumer).not_to be_valid
  # end
  it 'has the consumer role' do
    consumer = FactoryGirl.build(:consumer)
    expect(consumer.roles).to eq([:consumer])
  end
  
end
