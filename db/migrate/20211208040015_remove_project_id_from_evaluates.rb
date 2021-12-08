class RemoveProjectIdFromEvaluates < ActiveRecord::Migration[5.2]
  def change
    remove_column :evaluates, :project_id
  end
end
