class DropCollectionRatingTable < ActiveRecord::Migration
  def change
    drop_table :collection_ratings
  end
end
