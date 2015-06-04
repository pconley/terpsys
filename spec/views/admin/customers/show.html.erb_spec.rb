require 'rails_helper'

RSpec.describe "admin/customers/show", type: :view do
  before(:each) do
    expect_any_instance_of(SimpleCalendar::Calendar).to receive(:link_to).at_least(:once).and_return("")
    agency = FactoryGirl.create(:agency)
    admin  = FactoryGirl.create(:admin, agency: agency)
    sign_in admin
    @customer = assign(:customer, FactoryGirl.create(:customer, agency: agency))
  end

  it "renders attributes" do
    render
    # expect(rendered).to match(/Company/) # label
    expect(rendered).to match(@customer.company_name)
  end
end
