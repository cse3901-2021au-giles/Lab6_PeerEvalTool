class RemoveAssignmentIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :assignment_id
  end
end
