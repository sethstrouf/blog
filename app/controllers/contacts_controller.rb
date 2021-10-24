class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render :thanks
    else
      ContactMailer.general_message(@contact).deliver_later
      render :new
    end
  end

  def thanks
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
