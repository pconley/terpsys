require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, FactoryGirl.build(:customer))
  end
  it "renders new customer form" do
    render
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_company_name[name=?]", "customer[company_name]"
      #assert_select "input#customer_contact_email[name=?]", "customer[contact_email]"
    end
  end
end
