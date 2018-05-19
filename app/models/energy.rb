require 'csv'

class Energy < ApplicationRecord
  belongs_to :house

  def self.import_csv path='./data/dataset_50.csv', headers:true, col_sep:','
    data = []
    CSV.foreach(path, headers: headers, col_sep: col_sep) do |row|
      house = House.find row.field('House')
      create!(
        house: house,
        label: row.field('Label'),
        year: row.field('Year'),
        month: row.field('Month'),
        temperature: row.field('Temperature'),
        daylight: row.field('Daylight'),
        energy_production: row.field('EnergyProduction'),
      )
    end
  end
end
