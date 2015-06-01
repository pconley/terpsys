class CustomersController < ApplicationController
  
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    trace "*** CustomerController#index #{current_agency}"
    @customers = current_agency.customers.to_a
  end

  def show
  end

  def new
    dummy = {
      company_name:    Faker::Company.name,
      requester_name:  Faker::Name.name,
      requester_email: Faker::Internet.email,
      billing_email:   Faker::Internet.email,
      billing_rate:    Faker::Number.number(4) 
    }
    @customer = Customer.new( dummy )
  end

  def edit
  end

  def create
    trace "*** CustomerController#create #{params}"
    @customer = current_agency.customers.build(customer_params)
    trace "--- new customer = #{@customer}"

    if @customer.save
      trace "--- success #{@customer}"
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      trace "--- failure errors=#{@customer.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** CustomerController#update customer_params = #{customer_params}"
    if @customer.update(customer_params)
      trace "--- success #{@customer.inspect}"
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      trace "--- failure errors=#{@customer.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private  
  
  def set_customer
    @customer = current_agency.customers.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:company_name, :requester_name, :requester_email, :billing_email, :billing_rate)
  end
  
end
