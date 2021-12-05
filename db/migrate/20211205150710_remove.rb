class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :instructors, :instructors
  end
end
