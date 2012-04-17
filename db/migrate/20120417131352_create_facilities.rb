class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :serial
      t.integer :plant_id

      t.timestamps
    end
  end
end
