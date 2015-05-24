class ConsumersController < ApplicationController
  
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]
  
  before_action { trace "params = #{params}"}

  def index
    @consumers = Consumer.order('created_at DESC').all
  end

  def show
  end

  def new
    name = "test#{rand(1000000)}"
    @consumer = Consumer.new(last_name: name, first_name: 'test', gender: 'm')
    @consumer.build_user(username: name, email: "#{name}@test.com")
  end

  def edit
  end

  def create
    trace "*** ConsumersController#create #{params}"
    @consumer = Consumer.create(consumer_params)
    @consumer.build_user(user_params)
    @consumer.user.roles = [:consumer]
    trace "--- consumer = #{@consumer.inspect}"
    trace "--- user rec = #{@consumer.user.inspect}"
    if @consumer.save
      redirect_to @consumer, notice: 'Consumer was successfully created.'
    else
      trace "--- consumer save failed, errors = #{@consumer.errors.full_messages}"
      render :new
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
    @consumer.user.destroy # destroy the user which cascades to the consumer
    redirect_to consumers_url, notice: 'Consumer was successfully destroyed.'
  end

  private
  
  def set_consumer
    @consumer = Consumer.find(params[:id])
  end
  
  def consumer_params
    params.require(:consumer).permit(:last_name,:first_name,:gender)
  end
  
  def user_params
    params.require(:consumer).require(:user_attributes).permit(:username,:email,:password)
  end
  
end
