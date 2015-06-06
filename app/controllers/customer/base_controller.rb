class Customer::BaseController < ApplicationController
      
  before_action :authenticate_customer!
  before_action :set_globals
  
  helper_method :current_customer
  def current_customer
    current_user.try(:customer)
  end

private

  def set_globals
    @dashboard_path = customer_dashboard_path
    @header_partial = 'partials/header/header_customer'
  end

  def authenticate_customer!
    # trace "authenticate_admin! current_user=#{current_user}"
    redirect_to root_path unless current_user.requester?
  end
  
  def after_sign_in_path_for(resource)
    customer_dashboard_path if resource.try(:requester?)
  end

end