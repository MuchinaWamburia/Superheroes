class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @message = message

    mail(from: email, subject: 'Contact Form Message')
  end
end