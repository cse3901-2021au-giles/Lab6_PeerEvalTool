class CreateEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :evals do |t|
      #t.references :author, null:false, foreign_key: { to_table: :students }
      #t.references :recipient, null:false, foreign_key: { to_table: :students }
      t.text :comment
      t.integer :rating

      t.timestamps
    end
    #add_index :evals, [:user_id, :created_at]
  end
end
