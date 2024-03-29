require 'rails_helper'

RSpec.describe "admin/interpreters/show", type: :view do
  before(:each) do
    expect_any_instance_of(SimpleCalendar::Calendar).to receive(:link_to).at_least(:once).and_return("")
    interpreter = FactoryGirl.create(:interpreter)
    agency = interpreter.agency
    sign_in interpreter
    @interpreter = assign(:interpreter, FactoryGirl.create(:interpreter, agency: agency))
  end

  it "renders attributes" do
    render
    # expect(rendered).to match(/Company/) # label
    expect(rendered).to match(@interpreter.username)
  end
end
