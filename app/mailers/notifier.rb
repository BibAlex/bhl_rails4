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
  
  def user_reset_password_verification(user, url)
    @user = user
    @reset_password_url = url    
    @username = user.username    
    mail(content_type: "text/html", subject: I18n.t(:subject, :scope => [:notifier, :user_recover_account]), to: user.email, from: NO_REPLY_EMAIL_ADDRESS)
  end
  
  def user_activated(user)
    @user = user
    mail(content_type: "text/html", subject: I18n.t('notifier.user_activated.subject'), to: user.email, from: NO_REPLY_EMAIL_ADDRESS)
  end
  
  def user_change_password_notification(user)
    @user = user
    mail(content_type: "text/html", subject: I18n.t('notifier.user_change_password.subject'), to: user.email, from: NO_REPLY_EMAIL_ADDRESS)
  end

end
