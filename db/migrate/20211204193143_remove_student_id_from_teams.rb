class RemoveStudentIdFromTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :student_id
  end
end
