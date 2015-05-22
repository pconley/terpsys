require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, FactoryGirl.create(:customer))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/) # label
    expect(rendered).to match(@customer.company_name)
  end
end
