class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :classId

      t.timestamps
    end
  end
end
