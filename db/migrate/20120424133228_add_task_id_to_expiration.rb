class AddTaskIdToExpiration < ActiveRecord::Migration
  def change
    add_column :expirations, :task_id, :integer

  end
end
