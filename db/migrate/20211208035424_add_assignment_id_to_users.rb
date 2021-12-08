class AddAssignmentIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :assignmentt_id, :integer
  end
end
