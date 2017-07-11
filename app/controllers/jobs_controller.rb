class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:new, :create]
  before_action :set_job, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def new
    @job = @company.jobs.new
    @job.build_welfare
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "Job is successfully created"
      redirect_to @job
    else
      Rails.logger.info "Error #{@job.errors.full_messages}"
      flash[:notice] = "Job is failed to create."
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "Job successfully edited"
      redirect_to @job
    else
      Rails.logger.info "Error #{@job.errors.full_messages}"
      flash[:notice] = "Job edit failed"
      render :edit
    end
  end

  def destroy
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
  	params.require(:job).permit(
      :name,
  		:description,
  		:working_hours,
  		:dress_code,
  		:all_scopes,
      welfare_attributes: [
        :id,
        :training,
        :training_detail,
        :accomodation,
        :free_food,
        :free_food_detail,
        :other_benefits,
        :allowance
      ],
  	)
  end
end
