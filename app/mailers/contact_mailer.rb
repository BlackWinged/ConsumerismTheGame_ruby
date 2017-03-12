class ContactMailer < ApplicationMailer

  def contact_me(message, from, name)
    @message = message
    mail(to: 'lovro.gamulin@gmail.com', subject: 'Mail from your site (' + from + '; '+ name +')', reply_to: from)
  end
end

