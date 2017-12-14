class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました。"
    else
      flash.now[:alert] = "グループ作成失敗"
      render action: :new
    end
  end

  def edit
      @group = Group.find(params[:id])
  end

  def update
    # binding.pry
      @group = Group.find(params[:id])
      if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを更新しました。"
    else
      flash.now[:alert] = "グループ更新失敗"
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  
end
