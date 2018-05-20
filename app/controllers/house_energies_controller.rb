class HouseEnergiesController < ApplicationController
  # GET /energies
  # GET /energies.json
  def index
    @house = House.find(params[:house_id])
    @energies = @house.energies.includes(:house)
    gon.data = {
      labels: @energies.year_momths,
      temperatures: @energies.pluck(:temperature),
      daylights: @energies.pluck(:daylight),
      energy_productions: @energies.pluck(:energy_production),
    }
  end
end
