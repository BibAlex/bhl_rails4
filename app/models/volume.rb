class Volume < ActiveRecord::Base
  has_many :collection_volumes, dependent: :destroy
  has_many :collections, through: :collection_volumes
  has_many :user_volume_histories, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :book
  has_many :volume_ratings, dependent: :destroy
  has_many :activities, class_name: "Activity", as: :activitable, dependent: :destroy
  
  validates :book_id, presence: true
  validates :job_id, presence: true  
end