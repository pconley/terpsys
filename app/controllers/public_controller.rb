class PublicController < ApplicationController
  
  skip_before_action :authenticate_user!
    
  def home
    @title = "public home page"
  end
  
  def dashboard
    @title = "public dashboard"
  end
   
end