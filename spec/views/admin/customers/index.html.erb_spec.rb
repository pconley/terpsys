require 'rails_helper'

RSpec.describe "admin/customers/index", type: :view do
  before(:each) do
    @customer1 = FactoryGirl.create(:customer)
    @customer2 = FactoryGirl.create(:customer)
    assign(:customers, [@customer1,@customer2])
  end

  it "renders a list with headers" do
    render
    assert_select "tr>th", :text => "Company", :count => 1
    assert_select "tr>th", :text => "Requester", :count => 1
  end
  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => @customer1.company_name, :count => 1
    assert_select "tr>td", :text => @customer2.company_name, :count => 1
  end
  
end
