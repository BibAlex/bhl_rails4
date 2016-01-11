include ActionView::Helpers::SanitizeHelper

class Collection < ActiveRecord::Base
  has_many :collection_volumes, dependent: :destroy
  has_many :volumes, through: :collection_volumes #TODO I think this is wrong!! please check it!!
  has_many :collection_ratings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  belongs_to :user
  
  mount_uploader :photo_name, ImageUploader
  
  validates :title, presence: true, length: { within: 4..25 }
  validates :user_id, presence: true
  
  before_save :sanitize_html
  after_save :update_activity
  scope :top, -> { where("is_public = true").order("rate desc").limit(TOP_COLLECTIONS_COUNT).offset(0) }
  
  def sanitize_html
    self.title = sanitize(title, :tags=>[])
    self.description = sanitize(description, :tags=>[])
  end
  
  def update_activity
    Activity.add_activity({ activitable_id: self.id, action: "create", user_id: self.user_id, activitable_type: "collection", activitable_title: self.title })
  end
   
  def self.collection_params(params)
    params.permit(:title, :description, :is_public, :user_id, :rate, :photo_name)
  end
  
  def self.get_count_by_volume(volume_job_id, user_id)
    Collection.includes(:collection_volumes).where(collection_volumes: { volume_id: volume_job_id }).where('is_public=true or user_id=?', user_id).count
  end
  
  def self.process_collection_photo_name(photo_name)
    photo_name.original_filename = "image_#{DateTime.now.to_s}#{File.extname(photo_name.original_filename)}" if photo_name
    photo_name
  end
  
  def self.collection_params(params)
    params.permit(:title, :description, :is_public, :photo_name)
  end
  
   def delete_photo
    photo_path = "public#{File.dirname(self.photo_name_url)}"
    FileUtils.rm_rf photo_path if File.directory? photo_path
    
    # FileUtils.rm_rf "collections/#{collection.id}" if File.directory? "collections/#{collection.id}"
  end
end
