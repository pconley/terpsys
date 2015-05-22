class ConsumersController < ApplicationController
  
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]
  
  before_action { trace "params = #{params}"}

  def index
    @consumers = Consumer.all
  end

  def show
  end

  def new
    @consumer = Consumer.new
    @consumer.user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)    
    @consumer = Consumer.new(consumer_params)
    unless @user.valid? && @consumer.valid?
      render :new
      return
    else
      ActiveRecord::Base.transaction do
        @user.save!
        @consumer.save!
      end
      redirect_to @consumer, notice: 'Consumer was successfully created.' 
    end
  end

  def update
    if @consumer.update(consumer_params)
      redirect_to @consumer, notice: 'Consumer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @consumer.destroy
    redirect_to consumers_url, notice: 'Consumer was successfully destroyed.'
  end

  private
  
  def set_consumer
    @consumer = Consumer.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email)
  end

  def consumer_params
    params.require(:consumer).permit(:last_name, :first_name, :gender)
  end
  
end
