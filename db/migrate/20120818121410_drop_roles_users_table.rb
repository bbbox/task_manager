class DropRolesUsersTable < ActiveRecord::Migration
  def up
    drop_table :roles_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
