include ActionView::Helpers::SanitizeHelper

class User < ActiveRecord::Base
  
  has_many :collection_ratings, dependent: :destroy
  has_many :volume_ratings, dependent: :destroy
  has_many :user_volume_histories, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :annotations, dependent: :destroy
  has_many :queries, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  @email_format_re = /\A(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})\z/i
  
  attr_accessor :entered_password, :entered_password_confirmation, :email_confirmation
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 16 }
  validates :entered_password, presence: true, confirmation: true, length: { minimum: 4, maximum: 16 }, if: :password_validation_required?
  validates :email, presence: true, confirmation: true, format: @email_format_re, uniqueness: { case_sensitive: false }
  validates :real_name, presence: true
  
  mount_uploader :photo_name, ImageUploader
  
  before_create :generate_uuid
  before_create :encrypt_password
  before_create :generate_activation_code
  before_update :update_password
  before_save :sanitize_html
  
  
  
  
  def self.authenticate(username, password)
    return nil if username.nil? || password.nil?
    self.find_by_username_and_password_and_active(username, self.hash_password(password), 1)
  end
  
  def change_activation_code
    self.update_attributes(verification_code: generate_activation_code)
  end
  
  def activate
    self.update_attributes(active: 1, verified_date: Time.now, verification_code: "")
  end
  
  def self.user_params(params)
    params.permit(:username, :entered_password, :entered_password_confirmation, :email, :email_confirmation, :real_name, :photo_name)
  end  
  
  
  private
  
  def password_validation_required?
    password.blank? || password.nil? || ! self.entered_password.blank? || ! self.entered_password_confirmation.blank?
  end
  
  def generate_uuid
    self.guid = UUIDTools::UUID.timestamp_create().to_s unless self.guid?
  end
  
  def encrypt_password
    if self.valid? && ! self.entered_password.blank?
      self.password = User.hash_password(self.entered_password)
    else
      return true # encryption not required but we don't want to halt the process
    end
  end
  
  def generate_activation_code
    characters = ('a'..'z').to_a + ('0'..'9').to_a
    self.verification_code = SecureRandom.random_bytes(20).each_char.map do |char|
      characters[(char.ord % characters.length)]
    end.join
  end
  
  def update_password
    encrypt_password unless self.entered_password.blank?
  end
  
  def sanitize_html
    self.username = sanitize(username, :tags=>[])
    self.real_name = sanitize(real_name, :tags=>[])
    self.email = sanitize(email, :tags=>[])
  end
  
  def self.hash_password(pwd)
    Digest::MD5.hexdigest(pwd)
  end


  
end
