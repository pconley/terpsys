class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  include Trace
      
  def after_sign_in_path_for(resource)
    return interpreter_dashboard_path if resource.try(:interpreter?)
    return consumer_dashboard_path    if resource.try(:consumer?)
    return admin_dashboard_path       if resource.try(:admin?)
    root_path
  end
  
  helper_method :current_agency
  def current_agency
    current_user.try(:agency)
  end
  
  helper_method :agency_name
  def agency_name
    name = current_agency.try(:agency_name)
    name ||= 'TerpSYS'
  end
  
  def convert_date(field)
    date_string = job_params[field] # '05/25/2015'
    date_value = Date.strptime(date_string,"%m/%d/%Y") 
    params['job'][field] = date_value.strftime('%Y-%m-%d')    
  end
  
end
