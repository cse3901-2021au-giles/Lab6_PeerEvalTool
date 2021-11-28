class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
