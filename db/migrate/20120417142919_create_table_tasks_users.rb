class CreateTableTasksUsers < ActiveRecord::Migration
  create_table :tasks_users, id: false do |t|
    t.references :task, null: false
    t.references :user, null: false
  end

# Adding the index can massively speed up join tables. Don't use the
# unique if you allow duplicates.
  add_index(:tasks_users, [:task_id, :user_id], unique: true)
end
