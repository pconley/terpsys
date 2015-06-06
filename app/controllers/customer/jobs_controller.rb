class Customer::JobsController < Customer::BaseController
  
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = current_user.customer.jobs.order('starts_at ASC').all
  end

  def show
  end
  
  def edit
  end
  
  def new
    @job = Job.new({
      agency_id: current_agency.id,
      customer: current_customer,
      consumer_id: current_agency.consumers.last.id,
      description: Faker::Lorem.sentence([4,5,6].sample),
      start_time: Time.parse("1:00pm"),
      starts_at: Time.zone.now.to_date
    })
  end  

  def create
    trace "*** Customer::JobsController#create params = #{params}"
    trace "--- current agency = #{current_agency}"
    convert_date('starts_at') # changes the params
    trace "--- job params = #{job_params}"
    @job = Job.new(job_params.merge(agency: current_agency,customer: current_customer))
    @job.repeats = @job.repeat_style != 'None'
    @job.requested_at = Time.zone.now
    @job.created_id = current_user.id
    @job.updated_id = current_user.id
    @job.status ||= 'Pending'
    if @job.save
      redirect_to customer_job_path(@job), notice: 'Job was successfully created.'
    else
      trace "--- create failed. errors = #{@job.errors.full_messages}"
      render :new
    end
  end

  def update
    trace "*** Customer::JobsController#update job params = #{job_params}"
    convert_date('starts_at') # changes the params
    trace "--- job params = #{job_params}"
    @job.updated_id = current_user.id
    if @job.update(job_params)
      redirect_to customer_job_path(@job), notice: 'Job was successfully updated.'
    else
      trace "--- update failed. errors = #{@job.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to customer_jobs_url, notice: 'Job was successfully destroyed.'
  end
  
  private
    
  def set_job
    @job = current_agency.jobs.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:description, :consumer_id,
    :starts_at, :start_time, :duration, :ends_on, :repeats, :repeat_style, :repeat_pattern )
  end
  
end
