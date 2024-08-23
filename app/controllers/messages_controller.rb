class MessagesController < ApplicationController
  before_action :set_room

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to room_path(@room)
    else
      flash[:alert] = "メッセージの送信に失敗しました: #{@message.errors.full_messages.join(', ')}"
      redirect_to room_path(@room)
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end