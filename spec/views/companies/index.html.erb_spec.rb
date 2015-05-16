require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :contact_name => "Contact Name",
        :string => "String",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      ),
      Company.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :contact_name => "Contact Name",
        :string => "String",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
  end
end
