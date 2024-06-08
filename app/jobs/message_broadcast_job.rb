class MessageBroadcastJob < ApplicationJob
    queue_as :default

    def perform(message)
        ActionCable.server.broadcast "chat_channel", content: render_message(message)
    end

    private

    def render_message(message)
        ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end