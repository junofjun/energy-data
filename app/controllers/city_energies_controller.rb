class CityEnergiesController < ApplicationController
  # GET /energies
  # GET /energies.json
  def index
    @city = City.find(params[:city_id])
    @energies = @city.energies.includes(:house)
    @labels =
    gon.data = {
      labels: @energies.group(:label).year_momths,
      per_house: @energies.per_house_hash,
      per_has_child: @energies.per_has_child_hash,
      per_num_of_people: @energies.per_num_of_people_hash,
    }
  end
end
