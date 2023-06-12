class RacesController < ApplicationController
  before_action :set_race, only: %i[show destroy]

  def index
    @races = Race.all
  end

  def show
    @circuit = @race.circuit
    @team = @race.team
  end

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

  # Qualifying method for race
  def qualy
    puts 'Qualy test working'
  end

  private

  def race_params
    params.require(:race).permit(
      :user_id, :circuit_id, :team_id, :weather, :status, :team_a_id, :team_b_id, :team_c_id,
      :team_d_id, :team_e_id, :team_f_id, :team_g_id, :team_h_id, :team_i_id, :team_j_id
    )
  end

  def set_race
    @race = Race.find(params[:id])
  end
end
