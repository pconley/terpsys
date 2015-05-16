require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :contact_name => "MyString",
      :string => "MyString",
      :contact_phone => "MyString",
      :contact_email => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_address1[name=?]", "company[address1]"

      assert_select "input#company_address2[name=?]", "company[address2]"

      assert_select "input#company_city[name=?]", "company[city]"

      assert_select "input#company_state[name=?]", "company[state]"

      assert_select "input#company_zip[name=?]", "company[zip]"

      assert_select "input#company_contact_name[name=?]", "company[contact_name]"

      assert_select "input#company_string[name=?]", "company[string]"

      assert_select "input#company_contact_phone[name=?]", "company[contact_phone]"

      assert_select "input#company_contact_email[name=?]", "company[contact_email]"
    end
  end
end
