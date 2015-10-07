class EmailMessage < ActiveRecord::Base
    
  @email_format_re = /\A(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})\z/i
  
  validates :name, presence: true
  validates :email, presence: true, format: @email_format_re
  validates :message, presence: true
  validates :subject, presence: true
  
  def self.email_message_params(params)
    params.permit(:name, :email, :message, :subject)
  end
end
