class Public::PagesController < Public::BaseController
    
  def home
    @title = "public home page"
    @header_partial = 'partials/header/header'
  end
  
  def dashboard
    @title = "public dashboard"
  end
   
end