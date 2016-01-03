class UpdateDefaultOfTotalNumberOfViews < ActiveRecord::Migration
  def change
    change_column :user_volume_histories, :total_number_of_views, :integer, default: 1
  end
end
