class Collection < ActiveRecord::Base
  
  has_many :collection_volumes, dependent: :destroy
  has_many :volumes, through: :collection_volumes #TODO I think this is wrong!! please check it!!
  has_many :collection_ratings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  belongs_to :user
  
  validates :title, presence: true, length: { within: 4..25 }
  validates :user_id, presence: true
  
  before_save :sanitize_html
  
  scope :top, -> { where("is_public = true").order("rate desc").limit(TOP_COLLECTIONS_COUNT).offset(0) }
  
  def sanitize_html
    self.title = sanitize(title, :tags=>[])
    self.description = sanitize(description, :tags=>[])
  end
   
  def self.collection_params(params)
    params.permit(:title, :description, :is_public, :user_id, :rate, :photo_name)
  end
  
  def self.get_count_by_volume(volume_job_id, user_id)
    Collection.includes(:collection_volumes).where(collection_volumes: { volume_id: volume_job_id }).where('is_public=true or user_id=?', user_id).count
  end

end
