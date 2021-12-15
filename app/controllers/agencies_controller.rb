class AgenciesController < ApplicationController
  before_action :set_agency, only: %i[show]

  def index
    @agencies = Agency.all
  end

  def show
    @vehicles = Vehicle.where(agency: @agency)
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
  end
end
