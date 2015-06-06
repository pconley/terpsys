class Interpreter::JobsController < Interpreter::BaseController
  
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = current_user.interpreter_jobs.order('starts_at ASC').all
    # today = Time.zone.now.to_date
    # @past_jobs = current_user.interpreter_jobs.before(today).assigned
    # @today_jobs = current_user.interpreter_jobs.on_day(today).assigned
    # @future_jobs = current_user.interpreter_jobs.after(today).assigned
    @open_jobs = current_agency.jobs.open
  end

  def show
  end

  private
  
  def convert_date(field)
    date_string = job_params[field] # '05/25/2015'
    date_value = Date.strptime(date_string,"%m/%d/%Y") 
    params['job'][field] = date_value.strftime('%Y-%m-%d')    
  end
  
  def set_job
    @job = current_agency.jobs.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:description, :consumer_id, :customer_id, :interpreter_id,
    :starts_at, :start_time, :duration, :ends_on, :repeats, :repeat_style, :repeat_pattern )
  end
  
end
