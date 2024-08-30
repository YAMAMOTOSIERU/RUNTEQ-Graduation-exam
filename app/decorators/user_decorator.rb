# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.name.to_s
  end
end
