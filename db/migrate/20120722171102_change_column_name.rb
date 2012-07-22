class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :tasks, :status, :state
    change_column :tasks, :completion_date, :date
  end

  def down
    rename_column :tasks, :state, :status
    change_column :tasks, :completion_date, :datetime
  end
end
