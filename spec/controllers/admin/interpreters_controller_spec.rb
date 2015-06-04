require 'rails_helper'

RSpec.describe Admin::InterpretersController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:interpreter)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:interpreter, email: 'bademail')
  }

  let(:valid_session) { {} }
  
  before :each do
    @agency = FactoryGirl.create(:agency)
    @admin = FactoryGirl.create(:admin, agency: @agency)
    sign_in @admin
    @interpreter1 = FactoryGirl.create(:interpreter, agency: @agency)
    @interpreter2 = FactoryGirl.create(:interpreter, agency: @agency)
  end
    
  describe "GET #index" do
    it "assigns all interpreters as @interpreters" do
      # interpreter = Interpreter.create! valid_attributes
      get :index, {}, valid_session
      puts "count = #{assigns(:interpreters).count}"
      expect(assigns(:interpreters).to_a).to eq([@interpreter2,@interpreter1])
    end
  end

  describe "GET #show" do
    it "assigns the requested interpreter as @interpreter" do
      get :show, {:id => @interpreter1.to_param}, valid_session
      expect(assigns(:interpreter)).to eq(@interpreter1)
    end
  end

  describe "GET #new" do
    it "assigns a new interpreter as @interpreter" do
      get :new, {}, valid_session
      expect(assigns(:interpreter)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested interpreter as @interpreter" do
      get :edit, {:id => @interpreter1.to_param}, valid_session
      expect(assigns(:interpreter)).to eq(@interpreter1)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Interpreter" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created interpreter as @interpreter" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:interpreter)).to be_a(User)
        expect(assigns(:interpreter)).to be_persisted
      end

      it "redirects to the created interpreter" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_interpreter_path(User.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved interpreter as @interpreter" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:interpreter)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:interpreter, agency: @agency)
      }

      it "updates the requested interpreter" do
        put :update, {:id => @interpreter1.to_param, :user => new_attributes}, valid_session
        expect(@interpreter1.reload.email).to eq(new_attributes[:email])
      end

      it "assigns the requested interpreter as @interpreter" do
        put :update, {:id => @interpreter1.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:interpreter)).to eq(@interpreter1)
      end

      it "redirects to the interpreter" do
        put :update, {:id => @interpreter1.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_interpreter_path(@interpreter1))
      end
    end

    context "with invalid params" do
      it "assigns the interpreter as @interpreter" do
        put :update, {:id => @interpreter1.to_param, :user => invalid_attributes}, valid_session
        expect(assigns(:interpreter)).to eq(@interpreter1)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @interpreter1.to_param, :user => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested interpreter" do
      expect {
        delete :destroy, {:id => @interpreter1.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the interpreters list" do
      delete :destroy, {:id => @interpreter1.to_param}, valid_session
      expect(response).to redirect_to(admin_interpreters_url)
    end
  end

end
