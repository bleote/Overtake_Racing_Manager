class CarsController < ApplicationController
  before_action :set_car, only: %i[show]

  # List of all cars
  def index
    @cars = Car.all
  end

  def show; end

  def update
    update_setup_first_car
    update_setup_second_car
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:aero_setup, :gear_ratio, :tyres)
  end
end
