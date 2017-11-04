class UsersController < ApplicationController

  def edit

  end

  def update
    current_user.update(create_params)
    redirect_to :root
  end

  def create_params
    params.require(:user).permit(:name, :email)
  end

end
