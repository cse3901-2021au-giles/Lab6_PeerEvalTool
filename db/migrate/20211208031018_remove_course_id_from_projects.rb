class RemoveCourseIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :course_id
  end
end
