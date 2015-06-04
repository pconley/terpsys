require 'rails_helper'

RSpec.describe Admin::CustomersController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:customer)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:customer, company_name: nil)
  }

  let(:valid_session) { {} }
  
  before :each do
    @user = FactoryGirl.create(:admin)
    sign_in @user
    @agency = @user.agency
    @customer1 = FactoryGirl.create(:customer, agency: @agency)
    @customer2 = FactoryGirl.create(:customer, agency: @agency)
  end
    
  describe "GET #index" do
    it "assigns all customers as @customers" do
      customer = Customer.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:customers)).to eq([@customer1,@customer2])
    end
  end

  describe "GET #show" do
    it "assigns the requested customer as @customer" do
      get :show, {:id => @customer1.to_param}, valid_session
      expect(assigns(:customer)).to eq(@customer1)
    end
  end

  describe "GET #new" do
    it "assigns a new customer as @customer" do
      get :new, {}, valid_session
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested customer as @customer" do
      get :edit, {:id => @customer1.to_param}, valid_session
      expect(assigns(:customer)).to eq(@customer1)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, {:customer => valid_attributes}, valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, {:customer => valid_attributes}, valid_session
        expect(assigns(:customer)).to be_a(Customer)
        expect(assigns(:customer)).to be_persisted
      end

      it "redirects to the created customer" do
        post :create, {:customer => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_customer_path(Customer.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved customer as @customer" do
        post :create, {:customer => invalid_attributes}, valid_session
        expect(assigns(:customer)).to be_a_new(Customer)
      end

      it "re-renders the 'new' template" do
        post :create, {:customer => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:customer, agency: @agency)
      }

      it "updates the requested customer" do
        put :update, {:id => @customer1.to_param, :customer => new_attributes}, valid_session
        expect(@customer1.reload.company_name).to eq(new_attributes[:company_name])
      end

      it "assigns the requested customer as @customer" do
        put :update, {:id => @customer1.to_param, :customer => valid_attributes}, valid_session
        expect(assigns(:customer)).to eq(@customer1)
      end

      it "redirects to the customer" do
        put :update, {:id => @customer1.to_param, :customer => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_customer_path(@customer1))
      end
    end

    context "with invalid params" do
      it "assigns the customer as @customer" do
        put :update, {:id => @customer1.to_param, :customer => invalid_attributes}, valid_session
        expect(assigns(:customer)).to eq(@customer1)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @customer1.to_param, :customer => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested customer" do
      expect {
        delete :destroy, {:id => @customer1.to_param}, valid_session
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      delete :destroy, {:id => @customer1.to_param}, valid_session
      expect(response).to redirect_to(admin_customers_url)
    end
  end

end
