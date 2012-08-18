class ChangePlants < ActiveRecord::Migration
  def up
    remove_column :plants, :serial
    add_column :plants, :country_id, :integer
  end

  def down
    add_column :plants, :serial, :string
    remove_column :plants, :country_id
  end
end
