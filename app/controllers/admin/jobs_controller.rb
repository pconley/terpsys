class Admin::JobsController < Admin::BaseController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = current_agency.jobs.order('created_at DESC').all
  end

  def show
  end

  def new
    agency = current_agency
    now = Time.zone.now.to_date
    trace "*** now = #{now}"
    @job = Job.new({
      agency_id: agency.id,
      customer: agency.customers.first,
      consumer_id: agency.consumers.last.id,
      interpreter_id: agency.interpreters.first.id,
      start_time: Time.parse("1:00pm"),
      starts_at: now
    })
  end

  def edit
  end

  def create
    trace "*** JobsController#create params = #{params}"
    convert_date('starts_at') # changes the params
    trace "--- job params = #{job_params}"
    @job = Job.new(job_params.merge(agency: current_agency))
    @job.repeats = @job.repeat_style != 'None'
    @job.requested_at = Time.zone.now
    @job.created_id = current_user.id
    @job.updated_id = current_user.id
    @job.status ||= 'Active'
    if @job.save
      redirect_to admin_job_path(@job), notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    trace "*** JobsController#update job params = #{job_params}"
    convert_date('starts_at') # changes the params
    trace "--- job params = #{job_params}"
    @job.updated_id = current_user.id
    if @job.update(job_params)
      redirect_to admin_job_path(@job), notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_url, notice: 'Job was successfully destroyed.'
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
