class UserSessionsController < ApplicationController
  before_action :set_search, only: [:new, :create]
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to posts_path, success: t('user_sessions.create.success')
    else
      flash.now[:danger] = t('user_sessions.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, danger: t('user_sessions.destroy.success')
  end

  private

  def set_search
    @q = Post.ransack(params[:q])
  end
end
