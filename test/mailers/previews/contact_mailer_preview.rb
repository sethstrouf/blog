# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  # View at: http://localhost:3000/rails/mailers/contact_mailer
  
  def general_message
    contact = Contact.create(name: "Seth Adam",
                             email: "example@mail.com",
                             message: "Testing!! Hello!!")
    ContactMailer.general_message(contact)
  end

  def general_message_anonymous
    contact = Contact.create(name: "",
                             email: "example@mail.com",
                             message: "Testing!! Hello!!")
    ContactMailer.general_message(contact)
  end
end
