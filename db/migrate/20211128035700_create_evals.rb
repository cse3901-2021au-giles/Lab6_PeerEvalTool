class CreateEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :evals do |t|
      t.references :author, null: false, foreign_key: { to_table: :students }
      t.references :recipient, null: false, foreign_key: { to_table: :students }
      t.text :comments
      t.integer :rating
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
