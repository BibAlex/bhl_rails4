class AddBibtexToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bibtex, :string
  end
end
