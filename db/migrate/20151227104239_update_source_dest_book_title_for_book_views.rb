class UpdateSourceDestBookTitleForBookViews < ActiveRecord::Migration
  def change
    change_column :book_views, :source_book_title, :string, limit: 2000
    change_column :book_views, :dest_book_title, :string, limit: 2000
  end
end
