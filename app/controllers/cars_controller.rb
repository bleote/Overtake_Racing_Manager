class CarsController < ApplicationController
  before_action :set_car, only: %i[show]

  # List of all cars
  def index
    @cars = Car.all
  end

  def show; end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end
