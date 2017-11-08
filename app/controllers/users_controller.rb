class UsersController < ApplicationController

  def edit

  end

  def update
    if current_user.update(update_params)
      redirect_to :root
    elsif
      render action: :edit
    else

    end
  end

  def update_params
    params.require(:user).permit(:name, :email)
  end

end
