class CompaniesController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    if params[:tag]
      @companies = policy_scope(Company).tagged_with(params[:tag])
    else
      @companies = policy_scope(Company).limit(9)
    end
    # @companies = Company.all
  end

  def new
    @company = Company.new
    authorize @company
    @company.build_address
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      flash[:success] = "Company successfully created"
      redirect_to @company
    else
      Rails.logger.info "Error #{@company.errors.full_messages}"
      flash[:error] = "Failed to create company"
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:success] = "Company successfully edited"
      redirect_to @company
    else
      flash[:error] = "Failed to edit company"
      render :edit
    end
  end

  def show
    @ratings = @company.ratings
    if current_user
      @rating = Rating.new
      @rating.build_review
    end
    @first_job = @company.jobs.first
    @company_job = @company.jobs.drop(1)
  end

  private

  def set_company
    if params[:action] == 'show'
      @company = Company.includes(jobs: [:welfare, :scopes]).find(params[:id])
    else
      @company = Company.find(params[:id])
    end
    authorize @company
  end

  def company_params
    params.require(:company).permit(
      :logo,
  		:name,
  		:description,
  		:size,
  		:website,
      :all_tags,
      address_attributes: [
        :id,
        :street_address,
        :city,
        :country,
        :state,
        :postcode
      ],
  	)
  end
end
