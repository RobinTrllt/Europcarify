class RentalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @rental = Rental.new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @user = current_user
    @rental.vehicle = @vehicle
    @rental.user = @user
    if @rental.save
      redirect_to my_rentals_path
    else
      redirect_to vehicle_path(@vehicle)
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to my_rentals_path
  end

  def my_rentals
    @my_rentals = Rental.where(user: current_user)
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :vehicle_id, :user_id)
  end
end
