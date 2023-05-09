class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo])
  end

  # Create a race based on new race form choices
  def create_race
    @race = Race.new(race_params)
    @race.user = current_user
    if @race.save
      redirect_to race_path(@race)
    else
      render "races/new", status: :unprocessable_entity
    end
  end

  def destroy_race
    @race.destroy
    redirect_to root_path, status: :see_other
  end

  def update_setup_first_car
    @race = Race.find(19)
    @race_team = @race.selected_team
    @team_first_car = Team.find_by(team_name: @race_team).cars.first
    @team_first_car.update(car_params)
  end

  def update_setup_second_car
    @race = Race.find(19)
    @race_team = @race.selected_team
    @team_second_car = Team.find_by(team_name: @race_team).cars.last
    @team_second_car.update(car_params)
    redirect_to race_path(@race)
  end
end
