class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]

  def index
    @consumers = Consumer.all
  end

  def show
  end

  def new
    @consumer = Consumer.new
  end

  def edit
  end

  def create
    @consumer = Consumer.new(consumer_params)

    if @consumer.save
      redirect_to @consumer, notice: 'Consumer was successfully created.'
    else
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
    @consumer.destroy
    redirect_to consumers_url, notice: 'Consumer was successfully destroyed.'
  end

  private
  
  def set_consumer
    @consumer = Consumer.find(params[:id])
  end

  def consumer_params
    params.require(:consumer).permit(:last_name, :first_name, :gender)
  end
  
end
