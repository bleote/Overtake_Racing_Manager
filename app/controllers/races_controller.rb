class RacesController < ApplicationController
  before_action :set_race, only: %i[show destroy]

  def index
    @races = Race.all
  end

  def show; end

  # Setup a new race
  def new
    @race = Race.new
  end

  # Create race based on form choices
  def create
    @race = Race.new(race_params)
    @race.user = current_user
    if @race.save
      redirect_to race_path(@race)
    else
      render "races/new", status: :unprocessable_entity
    end
  end

  def destroy
    @race.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def race_params
    params.require(:race).permit(
      :selected_team, :selected_circuit, :weather, :status, :team01_id, :team02_id, :team03_id,
      :team04_id, :team05_id, :team06_id, :team07_id, :team08_id, :team09_id, :team10_id
    )
  end

  def set_race
    @race = Race.find(params[:id])
  end
end
