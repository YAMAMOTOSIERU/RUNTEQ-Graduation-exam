class ProfilesController < ApplicationController
    before_action :set_search, only: [:show]
  
    def show
      @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(10)
  
      start_date = current_user.posts.minimum(:created_at)&.to_date || Date.today
      end_date = current_user.posts.maximum(:created_at)&.to_date || Date.today
  
      @weight_data = (start_date..end_date).map do |date|
        post = current_user.posts.where(created_at: date.all_day).order(created_at: :desc).first
        [date, post&.weight || nil]
      end.to_h
  
      # グラフ用のデータも設定
      @weight_data_for_chart = current_user.posts.where.not(weight: nil)
                                           .group_by_day(:created_at)
                                           .average(:weight)
    end
  
    private
  
    def set_search
      @q = Post.ransack(params[:q])
    end
  end