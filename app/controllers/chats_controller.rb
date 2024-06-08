class ChatsController < ApplicationController
    before_action :set_search, only: [:show, :create]
    def show
        @user = User.find(params[:id])

        rooms = current_user.user_rooms.pluck(:room_id)
        user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)

        if user_room.nil?
            @room = Room.new
            @room.save
            UserRoom.create(user_id: @user.id, room_id: @room.id)
            UserRoom.create(user_id: current_user.id, room_id: @room.id)
        else
            @room = user_room.room
        end

        @chats = @room.chats.includes(:user)
        @chat = Chat.new(room_id: @room.id)
    end

    def create
        @chat = Chat.new(chat_params)

        respond_to do |format|
            if @chat.save
                format.html { redirect_to chat_path(id: @chat.room.user_rooms.where.not(user_id: current_user.id).first.user_id) }
                format.js
            else
                format.html { redirect_to chat_path(id: @chat.room.user_rooms.where.not(user_id: current_user.id).first.user_id) }
                format.js { render :errors }
            end
        end
    end

    private

    def set_search
        @q = Post.ransack(params[:q])
    end

    def chat_params
        params.require(:chat).permit(:message, :room_id).merge(user_id: current_user.id)
    end
end
