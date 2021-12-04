class RemoveTeamIdFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :team_id
  end
end
