class UsersController < ApplicationController
  # àçéèêîïôü
  def create
    @user = User.new(user_params)
  end


def create
  @user=User.new(user_params)
  @user.save!

   if @user.save
      mail = userMailer.with(user: @user).create_confirmation
      mail.deliver_now
      redirect_to user_path(@user)
    else
      render :new
    end
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
