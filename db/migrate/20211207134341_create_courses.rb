class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :cname
      t.string :user_id

      t.timestamps
    end
  end
end
