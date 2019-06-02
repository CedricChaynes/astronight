class UsersController < ApplicationController
  # àçéèêîïôü
  def create
    @user = User.new(user_params)
  end

  def update
    current_user.update!(user_params)
    redirect_back(fallback_location: edit_user_registration_path)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :mobile, :email, :avatar)
  end
end
