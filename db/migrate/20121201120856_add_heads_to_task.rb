class AddHeadsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :issued_department_head, :string
    add_column :tasks, :received_department_head, :string
  end
end
