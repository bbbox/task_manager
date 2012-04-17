class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :number
      t.text :description
      t.text :comments
      t.integer :issued_department_id
      t.integer :received_department_id
      t.integer :facility_id
      t.string :detailed_schedule_number
      t.string :code
      t.string :stamp_name
      t.integer :stage_id
      t.string :step_number
      t.string :contract_number
      t.integer :issued_chief_id
      t.integer :received_chief_id
      t.integer :issued_group_head_id
      t.integer :received_group_head_id
      t.integer :received_staff_id
      t.integer :chief_project_engineer_id
      t.date :issue_date
      t.integer :expiration_id

      t.timestamps
    end
  end
end
