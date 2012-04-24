class RemoveExpirationIdFromTask < ActiveRecord::Migration
  def up
    remove_column :tasks, :expiration_id
      end

  def down
    add_column :tasks, :expiration_id, :integer
  end
end
