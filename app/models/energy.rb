require 'csv'

class Energy < ApplicationRecord
  belongs_to :house

  module CityMethods
    def per_house_hash
      data = {}
      all.includes(:house).group('houses.first_name', :label).each{ |e|
        data[e.house.name] ||= []
        data[e.house.name] << e.energy_production
      }
      data
    end
    def per_has_child_hash
      data = {}
      all.includes(:house).group('houses.has_child', :label).each{ |e|
        p e.house.has_child
        data[e.house.has_child] ||= []
        data[e.house.has_child] << e.energy_production
      }
      data
    end
    [:num_of_people].each{|col|
      define_method "per_#{col}_hash", ->{
        data = {}
        all.includes(:house).group("houses.#{col}", :label).each{ |e|
          data[e.house.send(col)] ||= []
          data[e.house.send(col)] << e.energy_production
        }
        data
      }
    }
  end

  def year_month; "#{year}/#{month}" end
  def self.year_momths
    all.map &:year_month
  end

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
