class Interpreter::BaseController < ApplicationController
      
  before_action :authenticate_interpreter!
  before_action :set_globals

private

  def set_globals
    @dashboard_path = interpreter_dashboard_path
    @header_partial = 'partials/header/header_interpreter'
  end

  def authenticate_interpreter!
    # trace "authenticate_admin! current_user=#{current_user}"
    redirect_to root_path unless current_user.interpreter?
  end
  
  def after_sign_in_path_for(resource)
    interpreter_dashboard_path  if resource.try(:interpreter?)
  end

end