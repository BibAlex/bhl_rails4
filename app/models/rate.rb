class Rate < ActiveRecord::Base
  after_save :update_activity
  belongs_to :user
  belongs_to :rateable, polymorphic: true
  
  validates :rate, presence: true
  validates :user_id, presence: true
  validates :rateable_id, presence: true
  validates :rateable_type, presence: true
  
  scope :user_collection_rates, ->(id) {where(rateable_type: "collection", user_id: id)}
  
  def update_activity
    if rateable_type == "volume"
      volume = Volume.find_by_job_id(self.rateable_id)
      book = Book.find_by_id(volume.book_id)
      title =  book.nil? ? "" : book.title
    elsif rateable_type == "collection"
      collection = Collection.find_by_id(self.rateable_id)
      title =  collection.nil? ? "" : collection.title
    end
    Activity.add_activity({activitable_id: self.rateable_id, action: "rate", user_id: self.user_id, activitable_type: self.rateable_type,
                           value: self.rate, activitable_title: title })
  end
  
  def self.load_user_rate(user_id, rateable_id, rateable_type)
    Rate.where(user_id: user_id, rateable_id: rateable_id, rateable_type: rateable_type).select("rate").map(&:rate).first.to_f
  end
end