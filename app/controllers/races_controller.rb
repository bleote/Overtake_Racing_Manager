require_relative '../models/lap_time'

class RacesController < ApplicationController
  helper RaceHelper
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
  def qualifying
    @race = Race.find(params[:id])
    q1_lap_times = Rails.cache.fetch("q1_lap_times_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_lap_times_for_q1.sort_by(&:time)
    end

    top_20_q1_lap_times = q1_lap_times.first(20)

    q2_lap_times = Rails.cache.fetch("q2_lap_times_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_lap_times_for_q2
    end

    @q1_lap_times = top_20_q1_lap_times
    @q2_lap_times = q2_lap_times

    render "qualifying"
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
