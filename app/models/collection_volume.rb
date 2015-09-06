require 'acts_as_list'
class CollectionVolume < ActiveRecord::Base
  belongs_to :volume
  belongs_to :collection
  
  validates :volume_id, presence: true
  validates :collection_id, presence: true
  
  acts_as_list scope: :collection
end
