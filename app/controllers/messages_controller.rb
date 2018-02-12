class MessagesController < ApplicationController
    before_action :set_message, only: [:index,:new]
    before_action :group_id_find, only: :create

  def index
    @groups = current_user.groups
    if Group.present?
      @group = Group.find(params[:group_id])
      @messages = @group.messages.includes(:user)
    else
      redirect_to root_path
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: "メッセージを送信しました。"
    else
      redirect_to group_messages_path(@group), alert: "メッセージを入力してください。"
    end
  end

  private
  def set_message
    @message = Message.new
  end

  def group_id_find
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:body, :image, :image_cache).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
