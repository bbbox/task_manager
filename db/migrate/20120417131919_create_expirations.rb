class CreateExpirations < ActiveRecord::Migration
  def change
    create_table :expirations do |t|
      t.date :date
      t.timestamps
    end
  end
end
