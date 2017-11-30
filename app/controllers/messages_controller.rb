class MessagesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
    @member = Member.new
  end

  def index
    # binding.pry
    @groups = current_user.groups
    @message = Message.new
  end

  private
  def group_params
    params.require(:message).permit(:group_id)
  end
end
