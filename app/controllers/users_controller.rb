class UsersController < ApplicationController

  # def update
  #   current_user.update!(user_params)
  #   redirect_back(fallback_location: my_profile_path)
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password, :mobile, :email, :avatar)
  end
end
