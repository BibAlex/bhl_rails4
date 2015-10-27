class AddBibIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bib_id, :string
  end
end
