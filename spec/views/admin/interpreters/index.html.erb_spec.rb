require 'rails_helper'

RSpec.describe "admin/interpreters/index", type: :view do
  before(:each) do
    @interpreter1 = FactoryGirl.create(:interpreter)
    @interpreter2 = FactoryGirl.create(:interpreter)
    assign(:interpreters, [@interpreter1,@interpreter2])
  end

  it "renders a list with headers" do
    render
    assert_select "tr>th", :text => "Name", :count => 1
    assert_select "tr>th", :text => "Default Rate", :count => 1
  end
  it "renders a list of interpreters" do
    render
    assert_select "tr>td", :text => @interpreter1.username, :count => 1
    assert_select "tr>td", :text => @interpreter2.username, :count => 1
  end
  
end
