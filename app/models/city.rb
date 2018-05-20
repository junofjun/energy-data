class City < ApplicationRecord
  alias_attribute :to_s, :name

  has_many :houses
  has_many :energies, ->{ extending Energy::CityMethods },
    through: :houses
end
