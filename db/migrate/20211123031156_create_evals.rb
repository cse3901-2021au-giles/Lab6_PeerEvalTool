class CreateEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :evals do |t|
      t.string :authorId
      t.string :recipientId
      t.string :comments
      t.string :ratings
      t.string :activityId

      t.timestamps
    end
  end
end
