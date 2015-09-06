class UserVolumeHistory < ActiveRecord::Base
  belongs_to :volume
  belongs_to :user
  
  validates :user_id, presence: true
  validates :volume_id, presence: true
end
