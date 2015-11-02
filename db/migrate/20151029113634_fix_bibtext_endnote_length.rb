class FixBibtextEndnoteLength < ActiveRecord::Migration
  def change
    change_column :books, :bibtex, :text
    change_column :books, :endnote, :text
  end
end
