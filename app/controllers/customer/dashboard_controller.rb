class Customer::DashboardController < Customer::BaseController
    
  def show
    @jobs = current_user.customer.jobs
    # today = Time.zone.now.to_date
    # @past_jobs   = @jobs.after(today)
    # @today_jobs  = @jobs.on_day(today)
    # @future_jobs = @jobs.before(today)
  end
   
end