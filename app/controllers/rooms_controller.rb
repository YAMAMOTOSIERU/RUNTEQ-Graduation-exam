# frozen_string_literal: true

class RoomsController < ApplicationController
  def chat_index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(created_at: :asc)
    @message = Message.new
    @other_user = @room.users.where.not(id: current_user.id).first
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '指定されたルームが見つかりません。'
    redirect_to chat_index_path
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
