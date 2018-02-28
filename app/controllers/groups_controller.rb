class GroupsController < ApplicationController

  before_action :find_group, only: %i(edit update)
  before_action :find_member, only: %i(new edit update)

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group)
    else
      flash.now[:alert] = "グループ作成失敗"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを更新しました。"
    else
      flash.now[:alert] = "グループ更新失敗"
      render action: :edit
    end
  end

  def find_group
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_member
    @members = @group.users
  end

end
