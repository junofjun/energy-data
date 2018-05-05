class AddHasChildColumnToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :has_child, :boolean
  end
end
