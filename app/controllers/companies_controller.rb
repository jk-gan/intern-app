class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    @company.build_address
  end

  def create
    @company = Company.new(company_params)
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
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "Company successfully edited"
      redirect_to company_url(@company.id)
    else
      flash[:error] = "Failed to edit company"
      render :edit
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

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
