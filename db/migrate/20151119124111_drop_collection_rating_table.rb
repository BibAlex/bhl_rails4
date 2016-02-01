class DropCollectionRatingTable < ActiveRecord::Migration
  def change
    drop_table :collection_ratings if ActiveRecord::Base.connection.table_exists? 'collection_ratings'
  end
end
