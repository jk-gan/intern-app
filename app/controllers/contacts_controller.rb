class ContactsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  before_action :set_contact, only: [:edit, :update]

  def new
    @contact_person = @company.build_contact
  end

  def create
    @contact_person = @company.build_contact(contact_params)
    # authorize @contact_person
    if @contact_person.save
      flash[:success] = "Contact Person successfully created"
      redirect_to @company
    else
      Rails.logger.info "Error #{@contact_person.errors.full_messages}"
      flash[:notice] = "Contact Person failed to create"
      redirect_to new_company_contact_url
    end
  end

  def edit
  end

  def update
    if @contact_person.update(contact_params)
      flash[:success] = "Contact successfully edited"
      redirect_to @contact_person.company
    else
      Rails.logger.info "Error #{@contact_person.errors.full_messages}"
      flash[:success] = "Contact failed edited"
      redirect_to company_url(@company.id)
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_contact
    @contact_person = Contact.find(params[:id])
    # authorize @contact_person
  end

  def contact_params
    params.require(:contact).permit(
      :name,
      :role,
      :avatar,
      :contact_number,
      :email,
    )
  end
end
