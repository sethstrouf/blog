class ContactMailer < ApplicationMailer

  def general_message(contact)
    @contact = contact
    mail to: "seth.strouf@doane.edu", subject: "Message from your website!"
  end
end
