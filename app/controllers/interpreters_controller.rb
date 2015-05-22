class InterpretersController < ApplicationController
  before_action :set_interpreter, only: [:show, :edit, :update, :destroy]

  def index
    @interpreters = Interpreter.all
  end

  def show
  end

  def new
    @interpreter = Interpreter.new
  end

  def edit
  end

  def create
    @interpreter = Interpreter.new(interpreter_params)

    if @interpreter.save
      redirect_to @interpreter, notice: 'Interpreter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @interpreter.update(interpreter_params)
      redirect_to @interpreter, notice: 'Interpreter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @interpreter.destroy
    redirect_to interpreters_url, notice: 'Interpreter was successfully destroyed.'
  end

  private
  
  def set_interpreter
    @interpreter = Interpreter.find(params[:id])
  end

  def interpreter_params
    params.require(:interpreter).permit(:default_payrate)
  end
  
end
