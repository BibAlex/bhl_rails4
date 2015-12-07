class Rate < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :rateable, polymorphic: true
  
  validates :rate, presence: true
  validates :user_id, presence: true
  validates :rateable_id, presence: true
  validates :rateable_type, presence: true
  
  def self.load_user_rate(user_id, rateable_id, rateable_type)
    Rate.where(user_id: user_id, rateable_id: rateable_id, rateable_type: rateable_type).select("rate").map(&:rate).first.to_f
  end
  
end
