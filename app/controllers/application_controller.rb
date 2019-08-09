class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar,
      :cover, :cover_cache, :remove_cover, :bio) }
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
