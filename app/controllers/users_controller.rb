class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name,
    :email, :password)
  end

end
