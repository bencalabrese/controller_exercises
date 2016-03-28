class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    total_contacts = user.contacts + user.shared_contacts
    render json: total_contacts
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    render json: @contact
    @contact.destroy
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  private
  def contact_params
    # not secure to include user_id, but just for learning purposes
    params.require(:contact).permit(:user_id, :name, :email)
  end
end
