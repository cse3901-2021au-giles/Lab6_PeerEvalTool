class AddDefaultToCommentedNum < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :commented_num, :integer, :default => 0
  end
end
