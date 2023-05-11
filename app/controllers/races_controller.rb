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
    create_race
  end

  def destroy
    destroy_race
  end

  # Qualifying method for race
  def qualy
    puts 'Qualy test working'
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
