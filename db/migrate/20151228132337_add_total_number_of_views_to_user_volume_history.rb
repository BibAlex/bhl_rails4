class AddTotalNumberOfViewsToUserVolumeHistory < ActiveRecord::Migration
  def change
    add_column :user_volume_histories, :total_number_of_views, :integer, default: 0
  end
end
