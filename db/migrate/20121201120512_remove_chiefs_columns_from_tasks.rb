class RemoveChiefsColumnsFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :issued_chief_id
    remove_column :tasks, :received_chief_id
  end

  def down
    add_column :tasks, :issued_chief_id, :integer
    add_column :tasks, :received_chief_id, :integer
  end
end
