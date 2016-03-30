class Volume < ActiveRecord::Base
  has_many :collection_volumes, dependent: :destroy
  has_many :collections, through: :collection_volumes
  has_many :user_volume_histories, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :book
  has_many :rates, dependent: :destroy
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  
  has_many :source_book_views, :class_name => "BookView", :foreign_key => :source_book_id, :primary_key => :job_id
  has_many :dest_book_views, :class_name => "BookView", :foreign_key => :dest_book_id, :primary_key => :job_id  
  
  validates :book_id, presence: true
  validates :job_id, presence: true
  
  
  def volume_views(page)
    offset = (page.to_i - 1)* LIMIT_CAROUSEL
    Volume.find_by_sql("SELECT result.id, result.title FROM ((SELECT book_views.dest_book_id as id, books.title as title FROM book_views,volumes,books WHERE book_views.dest_book_id = volumes.job_id and books.id = volumes.book_id and  book_views.source_book_id = #{self.job_id}) UNION 
                        (SELECT book_views.source_book_id as id, books.title as title FROM book_views,volumes,books WHERE book_views.source_book_id = volumes.job_id and books.id = volumes.book_id and  book_views.dest_book_id = #{self.job_id})) result LIMIT #{LIMIT_CAROUSEL} OFFSET #{offset}")
  end
  
  def volume_views_count
    source_book_views.count + dest_book_views.count
  end
  
  def self.get_pending_content_volumes(batch_limit_param)
    limit = batch_limit_param || BATCH_LIMIT
    Volume.where("batch_id IS NULL AND status_id IS NULL").order("number_of_trials ASC").limit(limit)
  end
  
  def self.get_pending_indexing_volumes
    Volume.where(volume_status_id: VolumeStatus.pending_indexing.id)
  end
end