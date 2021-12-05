class AddAuthorRecipientToEvals < ActiveRecord::Migration[6.0]
  def change
    add_reference :evals, :author, null: false, foreign_key: { to_table: :students }
    add_reference :evals, :recipient, null: false, foreign_key: { to_table: :students }
  end
end
