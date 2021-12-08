class ChangeCoursesUserIdToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :user_id
    add_column :courses, :user_id, :integer
  end
end
