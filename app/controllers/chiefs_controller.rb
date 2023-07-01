class ChiefsController < ApplicationController
  before_action :set_chief, only: %i[show edit update]

  # List of all the team principals
  def index
    @chiefs = Chief.all
  end

  def show; end

  def edit; end

  def update
    if @chief.update(chief_params)
      redirect_to chief_path(@chief)
    else
      redirect_to 'chiefs/edit', status: :unprocessable_entity
    end
  end

  private

  def chief_params
    params.require(:chiefs).permit(:team_id, :name, :image)
  end

  def set_chief
    @chief = Chief.find(params[:id])
  end
end
