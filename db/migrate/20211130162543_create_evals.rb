class CreateEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :evals do |t|
      t.text :comment
      t.references :student, null: false, foreign_key: true
      t.string :rating

      t.timestamps
    end
    add_index :evals, [:user_id, :created_at]
  end
end
