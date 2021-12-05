class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :students, null: false, foreign_key: true
      t.references :teams, null: false, foreign_key: true

      t.timestamps
    end
  end
end
