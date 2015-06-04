class Admin::InterpretersController < Admin::BaseController
    
  before_action :set_interpreter, only: [:show, :edit, :update, :destroy]
  
  def index
    trace "*** InterpretersController#create agency=#{current_agency} #{params}"
    @interpreters = current_agency.interpreters.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}" # test data
    @interpreter = User.new(last_name: name, first_name: 'test', 
      default_payrate: 3500, roles: [:interpreter], 
      username: name, email: "#{name}@test.com")
  end

  def edit
  end

  def create
    trace "*** InterpretersController#create #{params}"
    @interpreter = User.create(interpreter_params.merge(agency: current_agency, roles: [:interpreter]))
    if @interpreter.save
      redirect_to admin_interpreter_path(@interpreter), notice: 'Interpreter was successfully created.'
    else
      trace "--- interpreter save failed, errors = #{@interpreter.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** InterpretersController#update #{params}"
    # only pass the password to update if interpreter entered one so delete
    params[:user].delete(:password) if params[:user][:password] == ''
    if @interpreter.update(interpreter_params)
      redirect_to admin_interpreter_path(@interpreter), notice: 'Interpreter was successfully updated.'
    else
      trace "--- interpreter save failed, errors = #{@interpreter.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @interpreter.destroy
    redirect_to admin_interpreters_url, notice: 'Interpreter was successfully destroyed.'
  end

  private
  
  def set_interpreter
    @interpreter = current_agency.interpreters.find(params[:id])
  end
  
  def interpreter_params
    params.require(:user).permit(:username,:email,:password,:last_name,:first_name,:default_payrate)
  end
    
end
