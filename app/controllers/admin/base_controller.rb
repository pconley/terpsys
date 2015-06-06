class Admin::BaseController < ApplicationController
      
  before_action :authenticate_admin!
  before_action :set_globals
  

private

  def authenticate_admin!
    # trace "authenticate_admin! current_user=#{current_user}"
    redirect_to root_path unless current_user.admin?
  end
  
  def after_sign_in_path_for(resource)
    admin_dashboard_path  if resource.try(:admin?)
  end
  
  def set_globals
    @dashboard_path = admin_dashboard_path
    @header_partial = 'partials/header/header_admin'
  end

end