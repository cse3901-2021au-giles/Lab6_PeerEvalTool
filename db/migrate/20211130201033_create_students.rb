class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      #t.references :team, foreign_key: true
      #t.references :instructor, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
    
    add_index :students, :email, unique: true
  end
end
