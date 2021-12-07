class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :admin
      t.string :name
      t.string :Fname
      t.string :Lname
      t.decimal :score
      t.integer :commented_num
      t.string :email
      t.string :reset_password_token

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :reset_password_token
  end
end
