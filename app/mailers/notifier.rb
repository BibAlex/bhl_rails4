class Notifier < ApplicationMailer
    
  helper :application 
  
  def contact_message(name,mail,subject,message)    
    @message = message.gsub(/\n/, '<br>')
    @name = name
    @email = mail
    mail(content_type: "text/html", subject: subject, to: CONTACT_US_EMAIL, from: NO_REPLY_EMAIL_ADDRESS)
  end
end
