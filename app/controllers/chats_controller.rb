class ChatsController < ApplicationController
    def index
      @messages = Message.order(created_at: :asc).last(20)
    end
end
