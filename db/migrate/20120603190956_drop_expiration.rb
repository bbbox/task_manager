class DropExpiration < ActiveRecord::Migration
  def up
    drop_table :expirations
  end

  def down
    create_table :expirations do |t|
      t.date :date
    end
  end
end
