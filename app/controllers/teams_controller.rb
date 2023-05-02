class TeamsController < ApplicationController
  before_action :set_team, only: %i[edit update]

  # List of all the teams
  def index
    @teams = Team.all
  end

  # Show page of a specific team
  def show; end

  # Edit a team
  def edit; end

  # Save a team update
  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render 'teams/edit', status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_logo, :color, :team_points)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
