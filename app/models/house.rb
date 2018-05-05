require 'csv'

class House < ApplicationRecord
  belongs_to :city

  def self.import_csv path, headers:true, col_sep:','
    data = []
    CSV.foreach(path, headers: headers, col_sep: col_sep) do |row|
      city = City.find_or_create_by! name: row.field('City')
      city.houses.create!(
        first_name: row.field('Firstname'),
        last_name: row.field('Lastname'),
        num_of_people: row.field('num_of_people'),
        has_child: (row.field('has_child') == 'YES'),
      )
    end
  end
end
