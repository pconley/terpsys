class CustomersController < ApplicationController
  
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    trace "*** CustomerController#create #{params}"
    @customer = Customer.new(customer_params)

    if @customer.save
      trace "--- success"
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      trace "--- failure errors=#{@customer.errors.full_messages}"
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private  
  
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:company_name, :requester_name, :requester_email, :billing_email, :billing_rate)
  end
  
end
