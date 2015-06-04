class Admin::DashboardController < Admin::BaseController
    
  def show
    @jobs = current_agency.jobs
    @customers = current_agency.customers
    @consumers = current_agency.consumers
    @interpreters = current_agency.interpreters
  end
   
end