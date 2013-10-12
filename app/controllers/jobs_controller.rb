class JobsController < ApplicationController
  before_action :set_job

  def index
  	@jobs = @patient.jobs
  end

  def new
  	@job = @patient.jobs.new()
  end

  def create
  	@job = @patient.jobs.new(job_params)
  	if @job.save
  		redirect_to patient_jobs_path(@patient), notice: "Job successfully created!"
  	else
  		render :new
  	end
  end

  private
  def job_params
  	params.require(:job).permit(:category, :description, :deadline_at)
  end

  def set_job
    @patient = Patient.find(params[:patient_id])
  end
end
