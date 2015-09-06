class CollectionRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  
  validates :rate, presence: true
  validates :user_id, presence: true
  validates :collection_id, presence: true
end
