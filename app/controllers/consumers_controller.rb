class ConsumersController < ApplicationController
    
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_agency.consumers.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}" # test data
    last = Faker::Name.last_name
    first = Faker::Name.first_name
    @user = User.new(last_name: last, first_name: first, 
      default_payrate: 3500, roles: [:consumer], 
      username: name, email: "#{name}@consumer.com")
  end

  def edit
  end

  def create
    trace "*** ConsumersController#create #{params}"
    @user = User.create(user_params.merge(agency: current_agency, roles: [:consumer]))
    if @user.save
      redirect_to consumer_path(@user), notice: 'Consumer was successfully created.'
    else
      trace "--- user save failed, errors = #{@user.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** ConsumersController#update #{params}"
    # only pass the password to update if user entered one so delete
    params[:user].delete(:password) if params[:user][:password] == ''
    if @user.update(user_params)
      redirect_to consumer_path(@user), notice: 'Consumer was successfully updated.'
    else
      trace "--- user save failed, errors = #{@user.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to consumers_url, notice: 'Consumer was successfully destroyed.'
  end

  private
  
  def set_user
    @user = current_agency.consumers.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:last_name,:first_name,:default_payrate)
  end
    
end
