# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.float :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
