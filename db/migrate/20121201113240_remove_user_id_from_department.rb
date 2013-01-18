class RemoveUserIdFromDepartment < ActiveRecord::Migration
  def up
    remove_column :departments, :user_id
  end

  def down
    add_column :departments, :user_id, :integer
  end
end
