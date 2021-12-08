class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :group_id
      t.integer :project_id

      t.timestamps
    end
  end
end
