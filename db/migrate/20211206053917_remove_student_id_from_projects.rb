class RemoveStudentIdFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :student_id
  end
end
