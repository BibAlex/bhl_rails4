class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activitable, polymorphic: true
  
  validates :user_id, presence: true
  validates :activitable_id, presence: true
  validates :action, presence: true
  validates :activitable_type, presence: true
end
