class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if
      @contact.save
      flash[:success] = "Contact added!"
      redirect_to company_path(@company)
    else
      flash[:failure] = "Contact not added. Maybe a field was left blank?"
      redirect_to company_path(@company)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end
end
