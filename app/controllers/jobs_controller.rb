class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
    @worker = current_worker.id
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if params[:completed] && @job.update(completed: true)
        puts("completed")
        respond_to do |format|
        format.html { redirect_to job_path(@job) }
        format.js
      end
      elsif
        params[:active] && @job.update(active: true)
        puts("active")
        respond_to do |format|
        format.html { redirect_to job_path(@job) }
        format.js
      end
    else
      params[:pending] && @job.update(pending: true, worker_id: current_worker.id)
      puts(@job.inspect)
        respond_to do |format|
        format.html { redirect_to job_path(@job) }
        format.js
      end
    end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'whoopsies'
      redirect_to job_path(@job)
    end
  end


private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
