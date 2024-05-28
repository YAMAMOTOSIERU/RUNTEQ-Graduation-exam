class PostsController < ApplicationController
  before_action :set_search, only: [:index, :new, :create, :show, :edit, :update, :destroy, :bookmarks]
  skip_before_action :require_login, only: [:index]

  def index
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      @post.save_tags(params[:post][:tag])
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      @post.save_tags(params[:post][:tag])
      redirect_to post_path(@post), success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: t('defaults.flash_message.deleted', item: Post.model_name.human)
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def set_search
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :body, :weight)
  end
end
