class InterpretersController < ApplicationController
    
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    trace "*** InterpretersController#create agency=#{current_agency} #{params}"
    
    @users = current_agency.interpreters.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}" # test data
    @user = User.new(last_name: name, first_name: 'test', 
      default_payrate: 3500, roles: [:interpreter], 
      username: name, email: "#{name}@test.com")
  end

  def edit
  end

  def create
    trace "*** InterpretersController#create #{params}"
    @user = User.create(user_params.merge(agency: current_agency, roles: [:interpreter]))
    if @user.save
      redirect_to interpreter_path(@user), notice: 'Interpreter was successfully created.'
    else
      trace "--- user save failed, errors = #{@user.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** InterpretersController#update #{params}"
    # only pass the password to update if user entered one so delete
    params[:user].delete(:password) if params[:user][:password] == ''
    if @user.update(user_params)
      redirect_to interpreter_path(@user), notice: 'Interpreter was successfully updated.'
    else
      trace "--- user save failed, errors = #{@user.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to interpreters_url, notice: 'Interpreter was successfully destroyed.'
  end

  private
  
  def set_user
    @user = current_agency.interpreters.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:last_name,:first_name,:default_payrate)
  end
    
end
