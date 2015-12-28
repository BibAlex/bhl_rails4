class Notifier < ApplicationMailer
    
  helper :application 
  
  def contact_message(name,mail,subject,message)    
    @message = message.gsub(/\n/, '<br>')
    @name = name
    @email = mail
    mail(content_type: "text/html", subject: subject, to: CONTACT_US_EMAIL, from: NO_REPLY_EMAIL_ADDRESS)
  end
  
  def user_verification(user, url)
    @user = user
    @verification_url = url
    mail(content_type: "text/html", subject: I18n.t('notifier.user_verification.subject'), to: user.email, from: NO_REPLY_EMAIL_ADDRESS )
  end
  
  def user_reset_password(user, url)
    @user = user
    @verification_url = url
    debugger
    mail(content_type: "text/html", subject: I18n.t('notifier.user_reset_password.subject'), to: user.email, from: NO_REPLY_EMAIL_ADDRESS )
  end
  
  def user_activated(user)
    @user = user
    mail(content_type: "text/html", subject: I18n.t('notifier.user_activated.subject'), to: user.email, from: NO_REPLY_EMAIL_ADDRESS)
  end

end
