class UserVolumeHistory < ActiveRecord::Base  
 
  belongs_to :volume
  belongs_to :user
  
  validates :user_id, presence: true
  validates :volume_id, presence: true
  
  scope :history, ->(user) {where(user: user)}
  
  def self.save_user_history(volume_id, user_id)
    UserVolumeHistory.create(user_id: user_id, volume_id: volume_id)
    SolrHelper.update_volume_views_in_solr(volume_id)
  end
end
