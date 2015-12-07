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
    Volume.find_by_sql("SELECT result.id, result.title FROM ((SELECT dest_book_id as id, dest_book_title as title FROM book_views WHERE source_book_id = #{self.job_id}) UNION 
                        (SELECT source_book_id as id, source_book_title as title FROM book_views WHERE dest_book_id = #{self.job_id})) result LIMIT #{LIMIT_CAROUSEL} OFFSET #{offset}")
  end
  
  def volume_views_count
    source_book_views.count + dest_book_views.count
  end
end