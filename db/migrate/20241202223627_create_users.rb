class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :user_username
      t.text :user_password_hash
      t.string :role

      t.timestamps
    end
    add_index :users, :user_username, unique: true
  end
end
