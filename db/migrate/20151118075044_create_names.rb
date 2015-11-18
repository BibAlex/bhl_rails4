class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string   "sci_name"
      t.integer  "eol_page_link"
      t.string   "eol_thumb_link"
      t.integer  "lookup_fail"
      t.timestamps
    end
  end
end
