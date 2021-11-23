class CreateClassSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :class_schedules do |t|
      t.string :name
      t.string :instructorId

      t.timestamps
    end
  end
end
