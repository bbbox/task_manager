class CreateTableRolesUsers < ActiveRecord::Migration
  create_table :roles_users, id: false do |t|
    t.references :role, null: false
    t.references :user, null: false
  end

# Adding the index can massively speed up join tables. Don't use the
# unique if you allow duplicates.
  add_index(:roles_users, [:role_id, :user_id], unique: true)
end
