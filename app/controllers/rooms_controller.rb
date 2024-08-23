class RoomsController < ApplicationController

  def chat_index
    @rooms = current_user.rooms
  end

  def show
    def show
      @room = Room.find(params[:id])
      @messages = @room.messages.order(created_at: :asc)
      @message = Message.new
    end
  end

  def create
    other_user = User.find(params[:user_id])
    
    # 既存のルームをチェック
    existing_room = current_user.rooms.joins(:users).where(users: { id: other_user.id }).first
    
    if existing_room
      redirect_to room_path(existing_room)
    else
      @room = Room.create
      UserRoom.create(room: @room, user: current_user)
      UserRoom.create(room: @room, user: other_user)
      redirect_to room_path(@room)
    end
  end
end