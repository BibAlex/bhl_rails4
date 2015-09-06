class Annotation < ActiveRecord::Base
  belongs_to :user
  belongs_to :volume
  
  validates :user_id, presence: true
  validates :volume_id, presence: true
  validates :page, presence: true
  validates :anntype, presence: true
end
