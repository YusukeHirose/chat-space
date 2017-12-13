class GroupsController < ApplicationController

  def index
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
     @group = Group.new
  end

  def update
    if @group = Group.update(group_params)
      redirect_to :root, notice: "グループを更新しました。"
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
