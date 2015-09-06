class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.string :message, null: false
      t.timestamps
    end
  end
end
