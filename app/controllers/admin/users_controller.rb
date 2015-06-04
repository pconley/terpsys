class Admin::UsersController < Admin::BaseController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_agency.users.order('created_at DESC').all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    trace "*** Admin::UsersController#create params=#{params}"
    @user = User.new(user_params.merge(agency: current_agency, roles: [:admin]))
    if @user.save
      trace '--- save worked'
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      trace "--- save failed. errors = #{@user.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** Admin::UsersController#update params=#{params}"
    if @user.update(user_params)
      trace '--- update worked'
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      trace "--- update failed. errors = #{@user.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'User was successfully destroyed.'
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end

