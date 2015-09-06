class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :commentable_id
      t.string  :commentable_type
      t.references :user
      t.integer :number_of_marks, default: 0
      t.timestamps
    end
    add_index :comments, :commentable_id
    add_index :comments, :user_id
  end
end
