class AddInstructorToTeam < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :instructor, null: false, foreign_key: true
  end
end
