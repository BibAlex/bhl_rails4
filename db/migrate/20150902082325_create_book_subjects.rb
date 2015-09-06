class CreateBookSubjects < ActiveRecord::Migration
  def change
    create_table :book_subjects do |t|
      t.references :book, null: false
      t.references :subject, null: false
      t.timestamps
    end
  end
end
