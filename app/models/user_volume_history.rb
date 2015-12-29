class UserVolumeHistory < ActiveRecord::Base  
 
  belongs_to :volume
  belongs_to :user
  
  validates :user_id, presence: true
  validates :volume_id, presence: true
  
  def self.save_user_history(volume_id, user_id)
    result = UserVolumeHistory.where(user_id: user_id, volume_id: volume_id)
    if result.blank?
      UserVolumeHistory.create(user_id: user_id, volume_id: volume_id, total_number_of_views: 1)
    else
      user_volume_history = result.first
      user_volume_history.update_attributes(total_number_of_views: user_volume_history.total_number_of_views + 1)
    end
    SolrHelper.update_volume_views_in_solr(volume_id)
  end
end
