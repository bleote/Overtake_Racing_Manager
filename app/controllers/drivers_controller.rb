class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit update]

  def index
    @drivers = Driver.all
  end

  def show; end

  def edit; end

  def update
    if @driver.update(driver_params)
      redirect_to driver_path(@driver)
    else
      render 'drivers/edit', status: :unprocessable_entity
    end
  end

  private

  def driver_params
    params.require(:driver).permit(
      :team_id, :car_id, :driver_name, :driver_picture, :helmet, :driving_skills,
      :fitness_level, :overtaking, :defending, :wet_race, :driver_points
    )
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end
end
