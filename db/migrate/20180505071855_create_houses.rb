class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.belongs_to :city, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :num_of_people

      t.timestamps
    end
  end
end
