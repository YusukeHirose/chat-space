class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit

  end

  def update
    if current_user.update(update_params)
      redirect_to :root, notice: "編集完了しました。"
    else
      flash.now[:alert] = "編集に失敗しました。"
      render action: :edit
    end
  end

  def update_params
    params.require(:user).permit(:name, :email)
  end

end
