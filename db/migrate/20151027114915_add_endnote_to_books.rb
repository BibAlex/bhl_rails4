class AddEndnoteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :endnote, :string
  end
end
