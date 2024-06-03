class ProfilesController < ApplicationController
    before_action :set_search, only: [:show]

    def show
        @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(10)
        @data = @posts.where.not(weight: nil).pluck(:created_at, :weight).to_h
    end

    private

    def set_search
        @q = Post.ransack(params[:q])
    end
end
