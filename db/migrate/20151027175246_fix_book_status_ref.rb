class FixBookStatusRef < ActiveRecord::Migration
  def change
    remove_column :books, :status_code
    add_column :books, :book_status_id, :integer
  end
end
