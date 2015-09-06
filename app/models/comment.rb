class Comment < ActiveRecord::Base
  belongs_to :user
  
  belongs_to :commentable, polymorphic: true
   
  has_many :replies, class_name: "Comment", as: :commentable, dependent: :destroy
  
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  validates :text, presence: true
  validates :commentable_id, presence: true
  before_save :sanitize_html
  
  def sanitize_html
     self.text = sanitize(text, :tags=>[])
   end
end
