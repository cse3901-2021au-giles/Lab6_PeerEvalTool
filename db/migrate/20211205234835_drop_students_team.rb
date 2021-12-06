class DropStudentsTeam < ActiveRecord::Migration[6.0]
  def change
    drop_table :students_teams
  end
end
