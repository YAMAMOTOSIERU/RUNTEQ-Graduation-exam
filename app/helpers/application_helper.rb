# frozen_string_literal: true

module ApplicationHelper
  def page_title(title = '')
    base_title = '筋トレアプリ'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
