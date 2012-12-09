class AddDepartmentHeadToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :department_head, :string
  end
end
