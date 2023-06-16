class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo])
  end

  def update_setup_first_car
    @race = Race.last
    @race_team = @race.team
    @team_first_car = Team.find_by(team_name: @race_team.team_name).cars.first
    @team_first_car.update(car_params)
  end

  def update_setup_second_car
    @race = Race.last
    @race_team = @race.team
    @team_second_car = Team.find_by(team_name: @race_team.team_name).cars.last
    @team_second_car.update(car_params)
    redirect_to race_path(@race)
  end
end
