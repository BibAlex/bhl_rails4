class UpdateActivitableTitle < ActiveRecord::Migration
  def change
    change_column :activities, :activitable_title, :string, limit: 2000
  end
end
