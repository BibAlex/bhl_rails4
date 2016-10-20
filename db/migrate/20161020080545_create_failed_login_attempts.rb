class CreateFailedLoginAttempts < ActiveRecord::Migration
  def change
    create_table :failed_login_attempts do |t|
      t.string :ip
      t.string :username
      t.integer :number_of_login_attempts

      t.timestamps null: false
    end
    add_index :failed_login_attempts, :ip
    add_index :failed_login_attempts, [:ip, :username]
  end
end
