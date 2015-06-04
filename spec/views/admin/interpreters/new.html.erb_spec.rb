require 'rails_helper'

RSpec.describe "admin/interpreters/new", type: :view do
  before(:each) do
    assign(:interpreter, FactoryGirl.build(:interpreter))
  end
  it "renders new interpreter form" do
    render
    assert_select "form[action=?][method=?]", admin_interpreters_path, "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      #assert_select "input#interpreter_contact_email[name=?]", "interpreter[contact_email]"
    end
  end
end
