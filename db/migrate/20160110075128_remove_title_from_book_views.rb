class RemoveTitleFromBookViews < ActiveRecord::Migration
  def change
    remove_column :book_views, :source_book_title
    remove_column :book_views, :dest_book_title
  end
end
