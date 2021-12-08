class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :evaluate_id
      t.integer :user_id
      t.integer :group_id
      t.string :score_float
      t.string :comments

      t.timestamps
    end
  end
end
