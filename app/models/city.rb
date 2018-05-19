class City < ApplicationRecord
  has_many :houses
  has_many :energies, through: :houses
end
