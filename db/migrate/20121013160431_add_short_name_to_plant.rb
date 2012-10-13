class AddShortNameToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :short_name, :string
  end
end
