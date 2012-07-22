class AddCompletionDateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :completion_date, :datetime
    add_column :tasks, :actual_completion_date, :datetime

  end
end
