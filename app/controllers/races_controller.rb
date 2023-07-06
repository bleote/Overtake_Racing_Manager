require_relative '../models/lap_time'

class RacesController < ApplicationController
  helper RaceHelper
  before_action :set_race, only: %i[show destroy qualifying gp results]
  before_action :set_circuit, only: %i[show qualifying gp results]
  before_action :set_team, only: %i[show qualifying gp results]

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

  # Qualifying method for race
  def qualifying
    @race.status = "Qualifying"
    @q1_lap_times = Rails.cache.fetch("q1_lap_times_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_lap_times_for_q1
    end

    @q2_lap_times = Rails.cache.fetch("q2_lap_times_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_lap_times_for_q2
    end

    @q3_lap_times = Rails.cache.fetch("q3_lap_times_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_lap_times_for_q3
    end
  end

  # GP method with race updates
  def gp
    qualifying
    @race.status = "Race day"
    @lap_number = @race.lap_number

    @qualifying_valid_laps = @q1_lap_times.last(5) + @q2_lap_times.last(5) + @q3_lap_times
    @starting_grid = @qualifying_valid_laps.sort_by(&:time)

    @start_race = Rails.cache.fetch("start_race_#{params[:id]}", expires_in: 2.days) do
      @race.calculate_race_laps(@starting_grid)
    end

    # Convert @start_race to JSON
    @start_race_json = @start_race.map do |driver, lap_times|
      [driver.id, { name: driver.name, initials: driver.initials, car_image: driver.car.image, lap_times: lap_times.map { |lt| lt[:lap_time] } }]
    end.to_h.to_json
  end

  def update_lap_number
    @race = Race.find(params[:race_id])
    @race.update(lap_number: params[:lap_number])
    render json: { status: 'success' }
  end

  # Results from race
  def results
    gp
    @race.status = "Finished"

    @sorted_race_results = @start_race.sort_by { |(_, lap_times)| lap_times.sum { |lt| lt[:lap_time] } }
    @team_a_id = 1
    @team_b_id = 2
    @team_c_id = 3
    @team_d_id = 4
    @team_e_id = 5
    @team_f_id = 6
    @team_g_id = 7
    @team_h_id = 8
    @team_i_id = 9
    @team_j_id = 10
  end

  private

  def race_params
    params.require(:race).permit(
      :user_id, :circuit_id, :team_id, :weather, :status, :lap_number, :team_a_id, :team_b_id, :team_c_id,
      :team_d_id, :team_e_id, :team_f_id, :team_g_id, :team_h_id, :team_i_id, :team_j_id
    )
  end

  def set_race
    @race = Race.find(params[:id])
  end

  def set_circuit
    @circuit = @race.circuit
  end

  def set_team
    @team = @race.team
  end
end
