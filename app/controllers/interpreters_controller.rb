class InterpretersController < ApplicationController
  before_action :set_interpreter, only: [:show, :edit, :update, :destroy]

  def index
    @interpreters = Interpreter.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}"
    @interpreter = Interpreter.new(last_name: name, first_name: 'test', default_payrate: 35)
    @interpreter.build_user(username: name, email: "#{name}@test.com")
  end

  def edit
  end

  def create
    trace "*** InterpretersController#create #{params}"
    @interpreter = Interpreter.create(interpreter_params)
    @interpreter.build_user(user_params)
    @interpreter.user.roles = [:interpreter]
    trace "--- interpreter = #{@interpreter.inspect}"
    trace "--- user assoc  = #{@interpreter.user.inspect}"
    if @interpreter.save
      redirect_to @interpreter, notice: 'Interpreter was successfully created.'
    else
      trace "--- interpreter save failed, errors = #{@interpreter.errors.full_messages}"
      render :new
    end
  end

  def update
    if @interpreter.update(interpreter_params)
      redirect_to @interpreter, notice: 'Interpreter was successfully updated.'
    else
      trace "--- interpreter save failed, errors = #{@interpreter.errors.full_messages}"
      puts "--- interpreter = #{@interpreter.inspect}"
      puts "--- interp.user = #{@interpreter.user.inspect}"
      render :edit
    end
  end

  def destroy
    @interpreter.user.destroy # destroy the user which cascades to the interpreter
    redirect_to interpreters_url, notice: 'Interpreter was successfully destroyed.'
  end

  private
  
  def set_interpreter
    @interpreter = Interpreter.find(params[:id])
  end

  def interpreter_params
    params.require(:interpreter).permit(:last_name,:first_name,:default_payrate)
  end
  
  def user_params
    params.require(:interpreter).require(:user_attributes).permit(:username,:email,:password)
  end
    
end
