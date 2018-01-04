class MessagesController < ApplicationController
    before_action :message_new, only: [:index,:new]

  def index
    @groups = current_user.groups
    if Group.present?
      @group = Group.find(params[:group_id])
    else
      redirect_to root_path
    end
    @messages = Message.all
  end

  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
    @member = Member.new
  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])
    if @message.save
      redirect_to group_messages_path(@group), notice: "メッセージを送信しました。"
    else
      redirect_to group_messages_path(@group), alert: "メッセージを入力してください。"
  end

  end

  def message_new
    @message = Message.new
  end


  private
  def group_params
    params.require(:message).permit(:group_id)
  end

  def message_params
    params.require(:message).permit(:body,:image,:image_cache).merge(user_id: current_user.id,group_id: params[:group_id])
  end
  
end
