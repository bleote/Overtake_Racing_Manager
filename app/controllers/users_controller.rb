class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update after_race]

  # Show the user's profile
  def show; end

  # Edit the profile
  def edit; end

  # Save profile updates
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "users/edit", status: :unprocessable_entity
    end
  end

  # Show the user's profile after race
  def after_race; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
