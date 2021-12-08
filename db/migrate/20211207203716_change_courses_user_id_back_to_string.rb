class ChangeCoursesUserIdBackToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :user_id
    add_column :courses, :user_id, :string
  end
end
