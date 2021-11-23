class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :teamId
      t.string :instructorId
      t.string :classId

      t.timestamps
    end
  end
end
