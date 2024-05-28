class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
        @q = @tag.posts.ransack(params[:q])
        @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    end
end
