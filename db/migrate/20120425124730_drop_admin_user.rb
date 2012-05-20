class DropAdminUser < ActiveRecord::Migration
  def up
    drop_table :admin_users
  end

  def down
    create_table :admin_users do |t|
      t.string   "email"
      t.string   "password"
    end
  end
end
