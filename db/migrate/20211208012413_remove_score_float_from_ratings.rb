class RemoveScoreFloatFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :score_float
  end
end
