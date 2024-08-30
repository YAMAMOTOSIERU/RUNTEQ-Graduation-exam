# frozen_string_literal: true

class Message < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  validates :room_id, presence: true

  belongs_to :room
  belongs_to :user

  # バリデーションエラーをログに出力するメソッド
  def log_errors
    Rails.logger.error "Message validation failed: #{errors.full_messages.join(', ')}" if invalid?
  end
end
