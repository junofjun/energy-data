require 'csv'

class House < ApplicationRecord
  belongs_to :city
  has_many :energies

  def self.import_csv path='./data/house_data.csv', headers:true, col_sep:','
    data = []
    CSV.foreach(path, headers: headers, col_sep: col_sep) do |row|
      city = City.find_or_create_by! name: row.field('City')
      create!(
        city: city,
        first_name: row.field('Firstname'),
        last_name: row.field('Lastname'),
        num_of_people: row.field('num_of_people'),
        has_child: (row.field('has_child') == 'YES'),
      )
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
