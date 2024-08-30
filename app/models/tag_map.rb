# frozen_string_literal: true

class TagMap < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
