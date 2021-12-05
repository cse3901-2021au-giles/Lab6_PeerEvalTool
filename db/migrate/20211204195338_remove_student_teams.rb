class RemoveStudentTeams < ActiveRecord::Migration[6.0]
  def change
      drop_table :Students_Teams
  end
end
