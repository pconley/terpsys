class Admin::ConsumersController < Admin::BaseController
    
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]

  def index
    @consumers = current_agency.consumers.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}" # test data
    last = Faker::Name.last_name
    first = Faker::Name.first_name
    @consumer = User.new(last_name: last, first_name: first, 
      default_payrate: 3500, roles: [:consumer], 
      username: name, email: "#{name}@consumer.com")
  end

  def edit
  end

  def create
    trace "*** ConsumersController#create #{params}"
    @consumer = User.create(user_params.merge(agency: current_agency, roles: [:consumer]))
    if @consumer.save
      redirect_to admin_consumer_path(@consumer), notice: 'Consumer was successfully created.'
    else
      trace "--- user save failed, errors = #{@consumer.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** ConsumersController#update #{params}"
    # only pass the password to update if user entered one so delete
    params[:user].delete(:password) if params[:user][:password] == ''
    if @consumer.update(user_params)
      redirect_to admin_consumer_path(@consumer), notice: 'Consumer was successfully updated.'
    else
      trace "--- user save failed, errors = #{@consumer.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @consumer.destroy
    redirect_to admin_consumers_url, notice: 'Consumer was successfully destroyed.'
  end

  private
  
  def set_consumer
    @consumer = current_agency.consumers.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:last_name,:first_name,:default_payrate)
  end
    
end
