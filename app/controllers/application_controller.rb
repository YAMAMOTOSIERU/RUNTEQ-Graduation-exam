class ApplicationController < ActionController::Base
    before_action :require_login
    before_action :set_action_cable_identifier
    before_action :set_search
    add_flash_types :success, :danger

  private

  def not_authenticated
    redirect_to login_path, danger: t('defaults.flash_message.require_login')
  end

  def set_action_cable_identifier
    cookies.signed[:session_id] = session.id.to_s
  end

  def set_search
    @q = Post.ransack(params[:q])
  end
end
