# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def receive(data)
    message = Message.create!(content: data['message'])
    ActionCable.server.broadcast('chat_channel', { message: render_message(message) })
  rescue StandardError => e
    ActionCable.server.broadcast('chat_channel', { error: e.message })
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: })
  end
end
