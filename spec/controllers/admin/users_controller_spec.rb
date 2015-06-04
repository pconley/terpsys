require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:admin)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:admin, email: 'bademail')
  }

  let(:valid_session) { {} }
  
  before :each do
    @agency = FactoryGirl.create(:agency)
    @user = FactoryGirl.create(:admin, agency: @agency)
    sign_in @user
    @user1 = FactoryGirl.create(:user, agency: @agency)
    @user2 = FactoryGirl.create(:user, agency: @agency)
  end
    
  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      #puts "count = #{assigns(:users).count}"
      expect(assigns(:users).to_a).to eq([@user2,@user1,@user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, {:id => @user1.to_param}, valid_session
      expect(assigns(:user)).to eq(@user1)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => @user1.to_param}, valid_session
      expect(assigns(:user)).to eq(@user1)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_user_path(User.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
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
        FactoryGirl.attributes_for(:user, agency: @agency)
      }

      it "updates the requested user" do
        put :update, {:id => @user1.to_param, :user => new_attributes}, valid_session
        expect(@user1.reload.email).to eq(new_attributes[:email])
      end

      it "assigns the requested user as @user" do
        put :update, {:id => @user1.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(@user1)
      end

      it "redirects to the user" do
        put :update, {:id => @user1.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_user_path(@user1))
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        put :update, {:id => @user1.to_param, :user => invalid_attributes}, valid_session
        expect(assigns(:user)).to eq(@user1)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @user1.to_param, :user => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => @user1.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => @user1.to_param}, valid_session
      expect(response).to redirect_to(admin_users_url)
    end
  end

end
