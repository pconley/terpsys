require "rails_helper"

RSpec.describe Admin::CustomersController, type: :routing do
  describe "routing" do
    it "routes to action" do
      expect(:get => "/admin/customers").to route_to("admin/customers#index")
      expect(:get => "/admin/customers/new").to route_to("admin/customers#new")
      expect(:get => "/admin/customers/1").to route_to("admin/customers#show", :id => "1")
      expect(:get => "/admin/customers/1/edit").to route_to("admin/customers#edit", :id => "1")
      expect(:post => "/admin/customers").to route_to("admin/customers#create")
      expect(:put => "/admin/customers/1").to route_to("admin/customers#update", :id => "1")
      expect(:delete => "/admin/customers/1").to route_to("admin/customers#destroy", :id => "1")
    end
  end
end
