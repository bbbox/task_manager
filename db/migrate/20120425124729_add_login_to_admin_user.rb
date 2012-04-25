class AddLoginToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :login, :string

  end
end
