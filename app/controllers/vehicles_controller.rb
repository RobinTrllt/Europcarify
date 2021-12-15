class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show]

  def index
    @vehicles = Vehicle.all
  end

  def show
    # pour rendre le véhicule indisponible si déjà réservé sur certaines dates
    @rentals = @vehicle.rentals
    @dates_off = @rentals.map do |reservation|
      {
        from: reservation.start_date,
        to: reservation.end_date
      }
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
