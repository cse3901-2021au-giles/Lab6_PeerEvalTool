class AddProjectIdToEvaluates < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluates, :project_id, :integer
  end
end
