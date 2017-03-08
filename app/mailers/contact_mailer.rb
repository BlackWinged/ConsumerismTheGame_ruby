class ContactMailer < ApplicationMailer
  def contact_me(message)

    mail(to: 'lovro.gamulin@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
