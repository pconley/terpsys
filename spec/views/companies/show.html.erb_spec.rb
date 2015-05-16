require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/Contact Email/)
  end
end
