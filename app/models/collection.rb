class Collection < ActiveRecord::Base
  has_many :collection_volumes, dependent: :destroy
  has_many :volumes, through: :collection_volumes
  
  has_many :collection_ratings, dependent: :destroy
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  belongs_to :user
  
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  validates :title, presence: true, length: { within: 4..25 }
  validates :user_id, presence: true
  
  before_save :sanitize_html
  
  def sanitize_html
     self.title = sanitize(title, :tags=>[])
     self.description = sanitize(description, :tags=>[])
   end

end
