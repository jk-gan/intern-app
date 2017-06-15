class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
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

  private

  def company_params
  	params.require(:company).permit(
  		:name,
  		:description,
  		:size,
  		:website,
      :all_tags
  	)
  end
end
